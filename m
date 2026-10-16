Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C0399003
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125912; cv=pass; b=NtITQbRBT76CJ3j/1lbwUKMSPmuJcFAbOlk8R/OGEkhp4hxoX47JWTAfgzo1SCsdbBYFMjKD3W7LFxOxvZeE0VSWRnaoLZRhD6EieoBHQAzRoewsGfvrLvrTqo3b7MkC73hfuzD+dxgMXEf2lnSB9njxviom/Hd4YQcSCXm/fII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125912; c=relaxed/simple;
	bh=CppuAwrCVWKh7L61ijt15Cz67qQ6rD0EDMpvkTLgXp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BSSn+thXB5Qn+7TLC75CivL8n96z7HZJLX97GeUYp8/zUjRTT0rcTNCwyc1i/af8hoXFfE68eL/viDk2nqerSrdpokuEdtjpPvrfywNh4IK+32PKz3iXyTSLEXt6Vy9PbcHlzzin2YZObuvq5Fcwd1R0i81Gj0YAF1hnC7xLqyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRk9lgXk; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRk9lgXk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso6491268a12.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 21:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792125908; cv=none;
        d=google.com; s=arc-20260327;
        b=btlPuQVl4ejnRj4LUZHMfY6p+mO/cxF5uYDDlD/6qSvaht3vOf5Prz1KXPUNKow8Q2
         nB5Obchb7orrWc7qxa/KL4sEwRSumN0BsbSlcjkPWk9WmVNpwOaFgIjx9S4i646C/ehR
         YCucU8z6OiotzFrf0RJ+/1Yfyi6u+P9TgD9k3XqGAXTNhDj0tihbRW4lB5UCfIMazZMX
         hxu8OxoSNcQ/iGlp9FRIQ04eBq1o5ALFP0YDkKsJoLlCCYU8S8Dh24IXA57NDQWCpLzW
         kvLQfwTBYfMCArz6lK00XHvBtvQuqNARR3b2lgpcoguBEGL98Ymog4+1ZBHr5Ivm/3rI
         nUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ogvKbCP9/YyvfB/lXnY8e8o2Ei89yT+b1dKcalCzK78=;
        fh=dbML1F1L5gu+HCRwum71rYSR9281OTetBMowlYWQLig=;
        b=mKRC3kU7BdIkF/bJkNM1ooB/wh5sk1WjqsSE40BSZ0bh8Ug/FFySLdgGRgCC05Zhdd
         HzhT+hIwNqsT8rgpn0FluJH8NKA7R0JqBM8Gva6868gbJKSQ2vfEbmVMkMO2WzfsNTZd
         wUyEi1OMIs3pIS7+gdPVXWa24Dy3O8S1/GuToXp6eW2GrQezm2+0qkVFGcsImm3gIaNd
         P0lh/b3fYf/VYJMkzcXa3ndPHkhdtIIkiuRAyZHozBiUEKljcEmdTf2/q8uELf8SRRjL
         Jesdmo/4zM0uFdtuQYRiM4ZK9qlPiWBWSbq//f2bc51APxgJxx8DQIPB84CphXaaKMyS
         1gmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125908; x=1792730708; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogvKbCP9/YyvfB/lXnY8e8o2Ei89yT+b1dKcalCzK78=;
        b=FRk9lgXktIf5tMrMUgok4cuAU2nWzA3n53Npqch/7dJnUKsrYarXBKyx/qgpynBhUl
         YiIUJyZ7VKNcUerFvQ10RsC2dKUk4B79p4C955KsbslMmW41ALWSU7B42YH2q9oAttEd
         XOHemmn8eos9HY/0MLd9sMTJlz44FZS2pzyWaW0oztMNK9Pdg0VvqpW8r8x9Ie+rPyEJ
         WA5DWY9P6T3zBKBtkVd0Q2VIbghK2fhyeOfenEf3IPhX5eoUIzMGhDJpbLQXoyvrNnu3
         AZNlT4mVIqrg91TD6cN+8lrtR46tdL99A0qpnYt+6Bdundln1+WAX2Fnnwz5baAPbHWm
         rTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125908; x=1792730708;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogvKbCP9/YyvfB/lXnY8e8o2Ei89yT+b1dKcalCzK78=;
        b=UPfc3KkNUI/jbr+KYdEWdR3sLo1Ka3+ZB0EGokeFSgwb4V7fHIqEzGF/hwtWyKV9jW
         Srpzbs0Q0wGFOz3h8UwGPPfhk6S4hIykYRL6K2g59e4YCBdwMJMwpEOHFbJnpii37FNO
         BFTfAF6v199rGWBeF96XcRkE8YHqMlcMbOoGLFJuoJG/lx2QEJs0BqoGNTfaA5OcXMfW
         os7ilDnyVCunsMLA56ZgB+R0696njvtOXAidAfOpRV1IfctlSwP9y3MUBgjFsShdjLOM
         ou0XWzRzkr/4xOc3Cm0VuJO2DCB2v0lPg4btRmbG7F9GHJ3rb07tJdVL6JjXcXDor1zQ
         RSvw==
X-Gm-Message-State: AFq9FYLUTYu1UCSoZBffNVJCmTEQfjIcO3gA0mmpMsP5YwJvDc/VFZey
	OQgZ6PiOOtvnoeE8MFOocPZ722W2D3DbYzsXAmrGe4+5aoClyCQO4L57XohKqH4/fKOHE2LctBH
	EnFbPQQ/Sfv9UVcYZ+MxZtfrbH2wwJ+gQSsW0WWUP8Q==
X-Gm-Gg: AYBFou19Dcs1dQpxdtbg2C7IrkBPYRd6N19nzfuKPSYFh68EzMkRi4zDspAdpl5v+j7
	dxFjj8AWTh63p+1Yj7Ok1hI0kYBGqxB/y6KzCzwL82ShuNihDteNpHLefGX/wa5iXPYFstpP6Ok
	xj/FIccqGMXetgBC9I1V/DXv3Cl3QqxmWoTREOjekK6x18jmwX14yZK0qrH7+bwlt4bK5FGVJQj
	7uIWcdTJSeSzJQDfDXAhlZjtghUXKTuewMsMdcYN2NzR1GJYV9I3jCdoho3H2VIPd92vy4Up0sx
	qSM4sEp2mAazhbIIcs7V6j0Osv2SPq+02Ze8WIQyeywxhhe4/2/AdfN5+Qghboi919qdwyVAA7A
	ggqJ6XkmJQIOn1EbRgJEYzPWd77chqTgsHhOIr+imiSCKynIB
X-Received: by 2002:a05:6402:44d8:b0:6ac:773b:9c55 with SMTP id
 4fb4d7f45d1cf-6b17c28a85fmr13667376a12.40.1792125908252; Thu, 15 Oct 2026
 21:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com> <20261016012148.GD3329673@ax162>
 <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
In-Reply-To: <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
From: Van Vo <vngocvan@gmail.com>
Date: Fri, 16 Oct 2026 11:44:56 +0700
X-Gm-Features: AclHuK9R9dH0oclmFmgOVjDJBzzplt2_PWPkcK8GSHmCC5e1U1qjr4JrFKUbxNo
Message-ID: <CAJavoFkS8iDeWyRObK26wDvq-vYc-VtdJin-uY5YSe7mMJ=GzQ@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

> How was this discovered?

This came from code inspection of standalone use of -d with an explicit
modules.order argument, followed initially by a constructed reproducer.
It was not a failure encountered through Kbuild's compile_commands.json
target.

I have now reproduced it using real Kbuild-generated artifacts from
0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_LKM=
=3Dm.

The following uses a disposable source tree at that base. The guards
prevent overwriting an existing output directory or result file:

    (
        set -eu
        test ! -e out
        test ! -e outside.json
        test ! -e inside.json
        make O=3Dout -j1 allnoconfig
        bash scripts/config --file out/.config --enable MODULES \
            --enable RUNTIME_TESTING_MENU --module TEST_LKM
        make O=3Dout -j1 olddefconfig
        make O=3Dout -j1 V=3D1 lib/

        outside_exit=3D0
        python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
            -d out -o outside.json out/lib/modules.order ||
            outside_exit=3D$?
        printf 'outside_exit=3D%s\n' "$outside_exit"

        inside_exit=3D0
        (cd out &&
         python3 -B ../scripts/clang-tools/gen_compile_commands.py -a ar \
             -o ../inside.json lib/modules.order) ||
            inside_exit=3D$?
        printf 'inside_exit=3D%s\n' "$inside_exit"
        test "$outside_exit" -eq 1
        test "$inside_exit" -eq 0
        python3 -c \
            'import json; assert len(json.load(open("inside.json"))) =3D=3D=
 1'
    )

Kbuild generated lib/test_module.o, lib/test_module.mod,
lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
modules.order contain lib/test_module.o.

The old script's invocation from the source directory fails with:

    FileNotFoundError: [Errno 2] No such file or directory:
'lib/test_module.mod'
    outside_exit=3D1

The same artifacts work when the old script is invoked from out/:

    inside_exit=3D0

The successful invocation produces one JSON entry for lib/test_module.c.
The patched script succeeds from the source directory and produces an
identical entry. The old script also fails with absolute paths for -d
and modules.order; the patched script succeeds with those paths too.

Only the standalone generator invocation is outside the build directory;
compilation itself runs under out/. This is not a full kernel build or
a boot/runtime test.

> I think you can omit the final sentence here, it does not add much value
> in my opinion.

I'll drop that sentence and clarify the standalone scope in v2.

> Please fix your name, this needs to be a known identity.

I'll use V=C3=B5 Ng=E1=BB=8Dc V=C4=83n for the author and sign-off in v2.

> os.path -> pathlib.Path but it should definitely be done as a separate
> patch.

I'll keep the pathlib conversion as a separate follow-up patch.

Thanks,
V=C3=B5 Ng=E1=BB=8Dc V=C4=83n

Thanks & best regards,

V


On Fri, Oct 16, 2026 at 10:53=E2=80=AFAM Van Vo <vngocvan@gmail.com> wrote:
>
> Hi Nathan,
>
> > How was this discovered?
>
> This came from code inspection of standalone use of -d with an explicit
> modules.order argument, followed initially by a constructed reproducer.
> It was not a failure encountered through Kbuild's compile_commands.json
> target.
>
> I have now reproduced it using real Kbuild-generated artifacts from
> 0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
> 3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_LK=
M=3Dm.
>
> The following uses a disposable source tree at that base. The guards
> prevent overwriting an existing output directory or result file:
>
>     (
>         set -eu
>         test ! -e out
>         test ! -e outside.json
>         test ! -e inside.json
>         make O=3Dout -j1 allnoconfig
>         bash scripts/config --file out/.config --enable MODULES \
>             --enable RUNTIME_TESTING_MENU --module TEST_LKM
>         make O=3Dout -j1 olddefconfig
>         make O=3Dout -j1 V=3D1 lib/
>
>         outside_exit=3D0
>         python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
>             -d out -o outside.json out/lib/modules.order ||
>             outside_exit=3D$?
>         printf 'outside_exit=3D%s\n' "$outside_exit"
>
>         inside_exit=3D0
>         (cd out &&
>          python3 -B ../scripts/clang-tools/gen_compile_commands.py -a ar =
\
>              -o ../inside.json lib/modules.order) ||
>             inside_exit=3D$?
>         printf 'inside_exit=3D%s\n' "$inside_exit"
>         test "$outside_exit" -eq 1
>         test "$inside_exit" -eq 0
>         python3 -c \
>             'import json; assert len(json.load(open("inside.json"))) =3D=
=3D 1'
>     )
>
> Kbuild generated lib/test_module.o, lib/test_module.mod,
> lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
> modules.order contain lib/test_module.o.
>
> The old script's invocation from the source directory fails with:
>
>     FileNotFoundError: [Errno 2] No such file or directory: 'lib/test_mod=
ule.mod'
>     outside_exit=3D1
>
> The same artifacts work when the old script is invoked from out/:
>
>     inside_exit=3D0
>
> The successful invocation produces one JSON entry for lib/test_module.c.
> The patched script succeeds from the source directory and produces an
> identical entry. The old script also fails with absolute paths for -d
> and modules.order; the patched script succeeds with those paths too.
>
> Only the standalone generator invocation is outside the build directory;
> compilation itself runs under out/. This is not a full kernel build or
> a boot/runtime test.
>
> > I think you can omit the final sentence here, it does not add much valu=
e
> > in my opinion.
>
> I'll drop that sentence and clarify the standalone scope in v2.
>
> > Please fix your name, this needs to be a known identity.
>
> I'll use V=C3=B5 Ng=E1=BB=8Dc V=C4=83n for the author and sign-off in v2.
>
> > os.path -> pathlib.Path but it should definitely be done as a separate
> > patch.
>
> I'll keep the pathlib conversion as a separate follow-up patch.
>
> Thanks,
> V=C3=B5 Ng=E1=BB=8Dc V=C4=83n
>
>
> On Fri, Oct 16, 2026 at 8:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Hi,
>>
>> On Thu, Oct 15, 2026 at 08:57:52PM +0700, vngocvan wrote:
>> > When invoked from outside the build tree with -d and a modules.order
>> > argument, the script opens .mod files relative to the current director=
y
>> > instead of the specified build directory. This can fail with
>> > FileNotFoundError or collect commands from unrelated artifacts in the
>> > current directory.
>>
>> How was this discovered? This cannot happen within Kbuild because this
>> script is always invoked from within the build folder, so was it a
>> manual invocation or something else?
>>
>> > Pass the build directory to cmdfiles_for_modorder() and resolve both
>> > the .mod files and their associated .cmd files relative to it. Absolut=
e
>> > paths continue to work, and the output location is unchanged.
>>
>> I think you can omit the final sentence here, it does not add much value
>> in my opinion.
>>
>> > Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.=
order in positional argument")
>> > Signed-off-by: vngocvan <vngocvan@gmail.com>
>>
>> Please fix your name, this needs to be a known identity.
>>
>> > ---
>> >  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>> >  1 file changed, 5 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/cla=
ng-tools/gen_compile_commands.py
>> > index 8d14b81efd73..149135f85f19 100755
>> > --- a/scripts/clang-tools/gen_compile_commands.py
>> > +++ b/scripts/clang-tools/gen_compile_commands.py
>> > @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>> >          yield to_cmdfile(obj)
>> >
>> >
>> > -def cmdfiles_for_modorder(modorder):
>> > +def cmdfiles_for_modorder(modorder, root_directory):
>> >      """Generate the iterator of .cmd files associated with the module=
s.order.
>> >
>> >      Parse the given modules.order, and yield every .cmd file used to =
build the
>> > @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>> >
>> >      Args:
>> >          modorder: The modules.order file to parse
>> > +        root_directory: The directory where the objects were built
>> >
>> >      Yields:
>> >          The path to every .cmd file found
>> > @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>> >              base, ext =3D os.path.splitext(obj)
>> >              if ext !=3D '.o':
>> >                  sys.exit('{}: module path must end with .o'.format(ob=
j))
>> > -            mod =3D base + '.mod'
>> > +            mod =3D os.path.join(root_directory, base + '.mod')
>> >              # Read from *.mod, to get a list of objects that compose =
the module.
>> >              with open(mod) as m:
>> >                  for mod_line in m:
>> > -                    yield to_cmdfile(mod_line.rstrip())
>> > +                    yield os.path.join(root_directory, to_cmdfile(mod=
_line.rstrip()))
>> >
>> >
>> >  def process_line(root_directory, command_prefix, file_path):
>> > @@ -206,7 +207,7 @@ def main():
>> >          elif path.endswith('.a'):
>> >              cmdfiles =3D cmdfiles_for_a(path, ar)
>> >          elif path.endswith('modules.order'):
>> > -            cmdfiles =3D cmdfiles_for_modorder(path)
>> > +            cmdfiles =3D cmdfiles_for_modorder(path, directory)
>> >          else:
>> >              sys.exit('{}: unknown file type'.format(path))
>> >
>> >
>> > base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
>> > --
>> > 2.56.0
>> >
>>
>> --
>> Cheers,
>> Nathan
