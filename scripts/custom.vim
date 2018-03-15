function! CallGpp()
python << EOF
import vim
from subprocess import Popen, PIPE

OUT_FILE_NAME = '/tmp/_Cpp_Error_Log_._tmp.out'

def open_windows():
    '''
    open one windows, and the below(right) be current window
    '''
    vim.command(':sp ')
    vim.current.window = vim.windows[-1]
    vim.current.window.height = 10
    return

def put_buffer(buffer_name):
    '''
    put the buffer in one windows
    '''
    vim.current.window = vim.windows[-1]
    vim.command(':b ' + buffer_name)
    return

def is_in_window(buffer_name):
    '''
    judge the buffer is hidden or in window
    '''
    for item in vim.windows:
        if item.buffer.name == buffer_name:
            return True
    return False


def find_tmp_file(file_name):
    '''
    finde file_name's buffer
    '''
    for f in vim.buffers:
        if f.name == file_name:
            if not is_in_window(file_name):
                open_windows()
                put_buffer(file_name)
            return f

    open_windows()
    vim.command('e '+ file_name)
    return vim.current.buffer

def print_msg(normal, error, f):
    '''
    print the Error and Normal msg
    '''
    b_out = find_tmp_file(f)

    if not b_out:
        print 'Error !!!!!'
        return
    info = ['-----Normal------']
    info += normal
    info.append('-----Error------')
    info += error

    b_out[0:] = info
    return

def run_arg():
    print vim.current.buffer.name
    cmd = ['g++', '-o', 'a.out']
    name = vim.current.buffer.name.split('/')[-1];
    cmd.append(name)

    result = Popen(cmd,  stdout=PIPE, stderr=PIPE)
    out = result.stdout.readlines()
    err = result.stderr.readlines()

    if not err:
        result = Popen('./a.out', stdout=PIPE, stderr=PIPE)
        tmp = result.stdout.readlines()
        out.append('>>>./a.out')
        out += tmp
        err.append('Successfully!')

    print_msg(out, err, OUT_FILE_NAME)

run_arg()
vim.current.window = vim.windows[0]
EOF
endfunction
