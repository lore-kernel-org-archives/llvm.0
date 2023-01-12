Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153D8470
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 18:55:52 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 20so9068186pfu.13
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+NRbTNiLmeYUADil1PoK0LGG/uPHqXhDMm4lsmIdtM=;
        b=nDzN9TwaVepTI4JV1CwYJSALuJFKTnskXh0c3eKxM76cQADzIF8k4QJNXr5mQ/x1bo
         0DpTZUTmHFuBjscdaIQZPyGFza3TIXAllmjPsLWwXZRN1ETM839IwF4cNTCTUh4XSmzc
         5YE1s//l4fqyuzFY8c5UdSm2xw3wU++yYZc678/Eo77PvzmmUGSUQTMcwNHjqtH9gkv+
         ZDHKKaG1KEEAYK03xSXWDJ2OeBynn2slTSp/LFyL24HqUraN5+CNfTldF4qvRmCz7NyE
         49+tAQ+KUBmgYOGSbXDP4ORjeehSewbWgwhfc2Kh299pzbcMtT8V4NItvTPngjNqe3Tn
         Bc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+NRbTNiLmeYUADil1PoK0LGG/uPHqXhDMm4lsmIdtM=;
        b=VDKzLfHZFMhsf5wKEo8er/8lhDWmcRbvQzv5h1EpF+R7rpw4QX2Ui8RQMKfGZrf4W1
         A8vXpb9/g/7X2QirZyMpzafZbIlMZfsYe58LV2UEIxcOmvpp6FSAvc6up54XMv46F1pE
         6qjXAri6+wZEZENr2b77bKGfkbCaGvRqxiWsr6H0zpKBljNKVuh2zLcI7lLkz5l/2Eqm
         A0lPDaVmRogtMbc1ouFMxC2tdlRHo+sgpvOg3vh0DUdNKrEJeje2VPJdFj+jBQ21AO3m
         ax3PaamSsSrYa6xJDZknUapL17j1QgJMa0rXyjjph8ha8YOzizngYN9LmquOKIbYGafq
         YVGA==
X-Gm-Message-State: AFqh2kqtOJGDRtRTTpyfn0/Cuuai3EeXsLJtkswulkAU5nYs0+3I91vh
	SuQgyZt6/RYpDGSGV36Qra/9xbE5Lx5ddt7fsZQwyw==
X-Google-Smtp-Source: AMrXdXuRsx/dID9s7vPNCdE3ysm0ZN/YTdpjQD8e+0PMDJN5HzzxmR5n62jAhFsDyc16t+/iWo5qN1TaqH8e66p8ZWs=
X-Received: by 2002:a63:c50:0:b0:494:7a78:4bb0 with SMTP id
 16-20020a630c50000000b004947a784bb0mr4810678pgm.427.1673549751960; Thu, 12
 Jan 2023 10:55:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112023006.1873859-1-masahiroy@kernel.org>
In-Reply-To: <20230112023006.1873859-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Jan 2023 10:55:45 -0800
Message-ID: <CAKwvOd=k=veNG=Q-bZxX4iX4q14e2ozO_sHZhdCz1+BwBxq=cQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: handle BrokenPipeError for python scripts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 6:30 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> In the follow-up of commit fb3041d61f68 ("kbuild: fix SIGPIPE error
> message for AR=3Dgcc-ar and AR=3Dllvm-ar"), Kees Cook pointed out that
> tools should _not_ catch their own SIGPIPEs [1] [2].
>
> Based on his feedback, LLVM was fixed [3].
>
> However, Python's default behavior is to show noisy bracktrace when
> SIGPIPE is sent. So, scripts written in Python are basically in the
> same situation as the buggy llvm tools.
>
> Example:
>
>   $ make -s allnoconfig
>   $ make -s allmodconfig
>   $ scripts/diffconfig .config.old .config | head -n1
>   -ALIX n
>   Traceback (most recent call last):
>     File "/home/masahiro/linux/scripts/diffconfig", line 132, in <module>
>       main()
>     File "/home/masahiro/linux/scripts/diffconfig", line 130, in main
>       print_config("+", config, None, b[config])
>     File "/home/masahiro/linux/scripts/diffconfig", line 64, in print_con=
fig
>       print("+%s %s" % (config, new_value))
>   BrokenPipeError: [Errno 32] Broken pipe
>
> Python documentatin [4] notes how to make scripts die immediately and

typo: s/documentatin/documentation/

> silently:
>
>   """
>   Piping output of your program to tools like head(1) will cause a
>   SIGPIPE signal to be sent to your process when the receiver of its
>   standard output closes early. This results in an exception like
>   BrokenPipeError: [Errno 32] Broken pipe. To handle this case,
>   wrap your entry point to catch this exception as follows:
>
>     import os
>     import sys
>
>     def main():
>         try:
>             # simulate large output (your code replaces this loop)
>             for x in range(10000):
>                 print("y")
>             # flush output here to force SIGPIPE to be triggered
>             # while inside this try block.
>             sys.stdout.flush()
>         except BrokenPipeError:
>             # Python flushes standard streams on exit; redirect remaining=
 output
>             # to devnull to avoid another BrokenPipeError at shutdown
>             devnull =3D os.open(os.devnull, os.O_WRONLY)
>             os.dup2(devnull, sys.stdout.fileno())
>             sys.exit(1)  # Python exits with error code 1 on EPIPE
>
>     if __name__ =3D=3D '__main__':
>         main()
>
>   Do not set SIGPIPE=E2=80=99s disposition to SIG_DFL in order to avoid
>   BrokenPipeError. Doing that would cause your program to exit
>   unexpectedly whenever any socket connection is interrupted while
>   your program is still writing to it.
>   """
>
> Currently, tools/perf/scripts/python/intel-pt-events.py seems the
> only script that fixes the issue that way.
>
> tools/perf/scripts/python/compaction-times.py uses another approach
> signal.signal(signal.SIGPIPE, signal.SIG_DFL) but the Python
> documentation clearly says "Don't do it".
>
> I cannot fix all Python scripts since there are so many.
> I fixed some in the scripts/ directory.

That's ok; "Rome wasn't built in a day." This is a good start!
Thank you for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> [1]: https://lore.kernel.org/all/202211161056.1B9611A@keescook/
> [2]: https://github.com/llvm/llvm-project/issues/59037
> [3]: https://github.com/llvm/llvm-project/commit/4787efa38066adb51e2c0494=
99d25b3610c0877b
> [4]: https://docs.python.org/3/library/signal.html#note-on-sigpipe
>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/checkkconfigsymbols.py         | 13 ++++++++++++-
>  scripts/clang-tools/run-clang-tools.py | 21 ++++++++++++++-------
>  scripts/diffconfig                     | 16 ++++++++++++++--
>  3 files changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols=
.py
> index 217d21abc86e..36c920e71313 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -115,7 +115,7 @@ def parse_options():
>      return args
>
>
> -def main():
> +def print_undefined_symbols():
>      """Main function of this module."""
>      args =3D parse_options()
>
> @@ -467,5 +467,16 @@ def parse_kconfig_file(kfile):
>      return defined, references
>
>
> +def main():
> +    try:
> +        print_undefined_symbols()
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
> +
> +
>  if __name__ =3D=3D "__main__":
>      main()
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
> index 56f2ec8f0f40..3266708a8658 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -61,14 +61,21 @@ def run_analysis(entry):
>
>
>  def main():
> -    args =3D parse_arguments()
> +    try:
> +        args =3D parse_arguments()
>
> -    lock =3D multiprocessing.Lock()
> -    pool =3D multiprocessing.Pool(initializer=3Dinit, initargs=3D(lock, =
args))
> -    # Read JSON data into the datastore variable
> -    with open(args.path, "r") as f:
> -        datastore =3D json.load(f)
> -        pool.map(run_analysis, datastore)
> +        lock =3D multiprocessing.Lock()
> +        pool =3D multiprocessing.Pool(initializer=3Dinit, initargs=3D(lo=
ck, args))
> +        # Read JSON data into the datastore variable
> +        with open(args.path, "r") as f:
> +            datastore =3D json.load(f)
> +            pool.map(run_analysis, datastore)
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
>
>
>  if __name__ =3D=3D "__main__":
> diff --git a/scripts/diffconfig b/scripts/diffconfig
> index d5da5fa05d1d..43f0f3d273ae 100755
> --- a/scripts/diffconfig
> +++ b/scripts/diffconfig
> @@ -65,7 +65,7 @@ def print_config(op, config, value, new_value):
>          else:
>              print(" %s %s -> %s" % (config, value, new_value))
>
> -def main():
> +def show_diff():
>      global merge_style
>
>      # parse command line args
> @@ -129,4 +129,16 @@ def main():
>      for config in new:
>          print_config("+", config, None, b[config])
>
> -main()
> +def main():
> +    try:
> +        show_diff()
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
> +
> +
> +if __name__ =3D=3D '__main__':
> +    main()
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
