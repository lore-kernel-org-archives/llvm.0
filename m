Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423391E260C
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131949; cv=pass; b=iIuEC5MTijxUVCLfmst8niQ/Ou3MuqaW5IOm7hy6lDlbp+jqhhdKwHx52KIDPUJ+Rb83ftU4ITm5X1Uf4iWpEcXsBUTdyiS+a2aUSxRj+/26hOYRg/MzrdE09u2YD47AsEiYBWhpgIpgqUK2O2LZtBPiecXQKtXh/I1KYeXWcwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131949; c=relaxed/simple;
	bh=mFA9Q2FmqawUFaWLuwiXo5/4OEiBaFAX67xYIrf45uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s80j7ts/MBkjzEqWMEgvFblvpNshZMnBRn2Mhpdc5fTDDrnbLyTwZBfOAkKw687XhwDiYF9uOmlPxJKCZz9T+GwIcygfWPTYtQAUcRXE2bFNRxBInM5FRbcdNItbvF4IpYsjjVpcTipVlMl9Bjamp884OIwQq9erKtz3v2LMY5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAsfWu5N; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAsfWu5N"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso1970110a12.1
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 23:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792131946; cv=none;
        d=google.com; s=arc-20260327;
        b=BgoZAXj+ugL8nS6R+dzafyApgjTmBxi/kSD7FPuuZHEb/IgTGAv8APR6dmA0muX8+Q
         PFRyfYWYa1Rk6Y1FvYR4eDNjiTsYUrumUzAxZMhWaVwDbvHD2NYUIcvYUhywQcRYY4Ac
         Sa0T5+r+Z8yU751qtC70dTKCIGrnaQ+gco9vSlGmkkZmIp5hMwLYtfUyBRM6s4wR+cc2
         5Sb/5fPWtDwp8eifCsoS/mgQDSqFALb50cztne23ctvNPDZ+N6xvQ+D+a34KnLoFkXE5
         BaId6nrKKigpy7pXc+uv0uSriPv/kGH/Xh/jZ+p2XKvXInxIM66iv1DgHxwdDIlJWZwh
         M5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        fh=ntqJkRlel8G04YnG1ZfXGPJCIAqHPPpF90vfUnB8F2w=;
        b=tBrPh7NjUONRoy7psRsEMld6TT+zbp4OViz1MGqrnUd4bHdJq5gqGk8+PxPaQNScu+
         OWx4+/2AGO/nJgHeTFCUsFr6kZtDEvllJEP8v+oVUdIS6HcVhR4WdKeOeG9oEQSPU5VE
         Ji8ZAzk2hQ/NXv3NTjEIHOoF/SAL53moKYNLYuqgFG8rmYiti43VS7AAHopQzgJpXl3i
         AfGHBaoAQLOCadUayrBjwpxUbzukdy0FDyGNapDkd7juihTD6kIYhbI493gGuG58Xo9X
         RHHdVuBV4ThwYDqdij04XVzZBf0PWgSmM////F8o/bKZTwKSKROwaBhaH5GeCCC6yR7X
         dahw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131946; x=1792736746; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        b=dAsfWu5N/7BTipLWGSEbUc0qneVCs8T7t/rSTCVpylHr84fzPRRr3c7EFM1f8+itAT
         irENKLhx47f3V+bEXd6SOb3TaX4fKPcBQUK1zfJM1EmaiZHeVutH6DiItZdKoixXMf6M
         wYlvndjjrAhKv+mXBb7qzbC3TDFzM/PbpnQ8HYnTpiYqIVpA538DBonEOiD53SSKQQWv
         OZiQTD5bxOXQkNDOaQjRY7kCltUFH/XwzCxETWCk3Vw1ycade7oWueDL41rdpmSWjqPs
         7YfnzQBc0RrqvssRYY2g0W977AwNDt7+8X3Z5ax5ZB7MNh3lZHxA6IZeEKp8gbFJiXWH
         Fm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131946; x=1792736746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        b=xQWLdvncXYLbJC0JT9xPQ9D+ydGZnCWXfAeXNOpfDdDRwscs8Nmvv+quWq0RXoyJZ6
         ZrAcZkUA/BuNCmgjYAO7Sqxfjw1tHuQpSoBUyTgpV8XxMDleJzqgQdtpQjZ8FNkD3/1D
         5/7dgadg510gqj5GIN3nv/RAO/SuZhXS2JSWpxVWW7sZI4NYBD9hURzH/97Ww6ie4J9Y
         qyk7Spwuwv6egTelCXBc6xqrAuDekMSzueSOJb5EyxyJqjO68nmClj81hSKUJFnBxwy+
         y3dF5kxCSvU3euwQgWf0w2yehTjOyut1b8GHuXPF6Szf70PwIoLUjYbNJjYK70LB1owj
         G4VQ==
X-Forwarded-Encrypted: i=1; AKwUvByrrhTxpTSm3XA3ZFLZp3QcOtya6dv3gYZNLeFhS0pxiJI7sfPxbEvnYgDDLQGIAMjPCtmI@lists.linux.dev
X-Gm-Message-State: AFq9FYKbHtKHZOy+DnPtFwNI1kSSN1SnWQuq45wJbEz3IzJ1x90+xXAG
	n7IoEUnx/gHF6KGC5a9w7vjy6kU3nWyH4ArLcwi9c/4H5Cvdo4/AfuHjBAk31RSDRSERDJyVhHX
	nwBfm6/W5g3sO0sg68PbpcIRsdpQHa6w=
X-Gm-Gg: AYBFou1le3JPaQtQ9dwuAi+WN2BHbB7Kc4NiaSSHUYnpHE/BFa42JJ+vyVQAPuZgwIy
	S4mFHPFfW1FXRb9vuXq91LYoE9VsR/YsX/23L5bIJ5xdqAl2YcqUc92Nn+YmCTy3JGS+VtpDBss
	wFTzqiNP9zGFBSHAwPMRL1T+qGAVetq1yp1uF//QsawFtxSnbamNVZPUnwCa1OBDdfcLlSPVrAP
	6McVd7rO4Ozbi+NqJqii6jQvqg+7I6Qd7MffhuTeFBIiAYwBgHgXOqXc12KRjkvT6io0jne0zpr
	Xz2/MgEuTMNlkeeMaR54ZJJUHJ93pA4gDdrhpM/QefvOl7P5hU3vd8Xaa8gY324Ic4qMlyxw4tt
	k1Mr0PM4i9DrFF7yn2iRxALO6bD+mQvzB0EcSNw3FMmikAb/5
X-Received: by 2002:a05:6402:4554:b0:6b1:ced2:dfd4 with SMTP id
 4fb4d7f45d1cf-6b1ced2e477mr7532991a12.21.1792131946100; Thu, 15 Oct 2026
 23:25:46 -0700 (PDT)
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
Date: Fri, 16 Oct 2026 13:25:33 +0700
X-Gm-Features: AclHuK9hFvot4yht4VqK2mVl9LZdXL_L1i4Fwbnceb4ZXgxpDMQaKbSEhgkboxA
Message-ID: <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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
