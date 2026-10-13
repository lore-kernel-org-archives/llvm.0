Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004253E2E3
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925667; cv=pass; b=jTbRmMQhv7hX0Swi7hf46PlyZW0ntLVn2cvO9KVCn6aL0FmlyW0t6obCxS9gKcezScK3mkaDuFLfdgjEwRzeKz9clfKpZpm6Ooo/iBGIm2o8NFvSfsIqHZBe8v8pXTcRKjO7G+Lwsb6X2XwUW9f+6+3x6Ho7mo6aRkScqUkotes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925667; c=relaxed/simple;
	bh=DqDEbYEh/GJ2vJ0RGLy9Z6paqTuoI8W26g9AmRu7lXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m28bZAMlaa3RpCq5w0Sh5cYJpwNa2SV21pRmZdyBhcIcrRsCDkOaV3ghFN1rWw7gLSMHHpbbj7M/dWDsk+qte3W9MFpQWlv0oR1mrS/P+ICS0/hr6NxsraOinYS7DFkOL1oihd89Xu8Ol5S+SyTGd3MuKJ49zbowDJbtLRg4AWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eia++WMG; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eia++WMG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1af482519so8679895e9.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 14:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791925662; cv=none;
        d=google.com; s=arc-20260327;
        b=AYiCaHvTy2TxVq1UJH//etzeROyE5gHLuyBxFSE9tJR0oauWTMKyGH4fZkHQVcn4vW
         7wd1uEr6FRzcndcUaZpdF+aZYfpWPj8Uxs3K4yEzfNxwpmYRhx17QEe471IX7u7QaJ0+
         3QuTCZeBlWHmYMAfKSGRwFAniu4zTAQsKzNPYX4Peo4obbo2nr2xIX4l3koYCztSoMo/
         NyukNJEGecPEjyF5S3r7dBnxo6pVBH5nx43tazlL8KDkjg630lipxaZKsI9Ur0HSXeKC
         YG2Yk/HBcf5HcrREOMOI/VnfkDXE+2ft0exi0YXT+dNyFHYD0V76XBHyEobKztGpGsFx
         RMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        fh=Duw0eE0UPjQOVUypp7hrQklZEPG07Bgjb3NnttiN82I=;
        b=PNZj4SAwdoj0EjoI/U1LhAm9QRVGWPSSO+hEeITkIoDe7Sh8SXqhnA16EBjvcI3Ehe
         blXZGOvhWAfOpnX3wBNAeWcK8LgZlcgXzvqbeutj19dhGQHRm81pjh/acihaT5lPXbAn
         6mUqajch+aRgb5yI+jmzasv7yjfRzIPrMN+YUVpJv/7QThxj2gqyVnQjNOgp5bPaRoiS
         zJqPMdHpR5hv55ggxOg3BW2PxYs1I5mgpjIf965BnbZ2o5QiWfG/EFiHEMK2VuXhQI+1
         uQcgSUZIW3gLbQ1oMasb92oxocG0Ss3cAuoMpUb8kaZg5rHgapXCVJqn5D8BfOzH6UVp
         Y+3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791925662; x=1792530462; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=Eia++WMGrXufD9dLe3KV9fSruJQXx7pVatJIjcFWhdHEKwkJBIOZ1M5nvH600RheUR
         /FVspxvaL7anPZ5FwkTVnY9JlyWu80+eC1FnyA5liR/1BgfjdLGJjNUMK+WEL/BFRVtV
         6pyYfpKGHm6RM2wm59cg+V5+iykFDncz+4CAD1cK+vVgBkQFo23MTJHWL4jxv1yz0wm2
         eZpZktHHHhhXqvz2df8ii8CysIzztaFwXBbQz+1YdUazMEptbgzwdPTzrItMlpzdoizo
         +889VEsUnuGxADRINqr88Y6aTU8Jlx/JIF+0hSppLCxwnwp1y3wpCAjdWSpFMWypV/lI
         UD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925662; x=1792530462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=hE8KiVnoLsLhtsAy6BIqLVIetQtGap3ZWK4LIQknp1cEDHAnZpbqEdRLSrCgMeEPSp
         F/DwT7neJyWU/NAPhXfG80nP6YFEP9Gmp+wJE3l4e0k3tF1zMQbXiEXSq2EFI97oBx/s
         wb6fURAk+I4FHOn5absb21NB9ZiquAWjNdGNOggmcphc8eIkQRjDF1MTvoe4XB2Rihfs
         mB6U2IEAPICAjW2PshabTxDdNmDvIemX1/UWeI3tC0Woe1fDwBJY4dUHJAFDeqWrsQAZ
         cnx1+uMA4xmzp7nHPAAyeqjfFcjgZl8eMKTML9GsFxTEBbMavEscJSZHPnG35DlRa87h
         +W5g==
X-Forwarded-Encrypted: i=1; AKwUvByfgm3KeTPcFOBA3ujUmnYrUeBhwCYRovOd330u75Bv9nSPCdr0A8oRpNWB4yMOiRZoNjIo@lists.linux.dev
X-Gm-Message-State: AFq9FYKW1FOempWjQuY4jzw9t/krATJ4uLIJ7kE47G4Wn8xlJqQ1khRJ
	uU/oaGc+YiWo4miu3yREWScNemrWAMQNq+VIU8DJyiSlaDhn1tGJGqQCfY8kMxeTfgKkAeeJ+iu
	DySnZXa7K/TnfLITqUkSooab7t/ovL2tD3HLMp+z5
X-Gm-Gg: AYBFou0fzBp701IVGOlmi9W2nLm32puoJc4rsbbkl2u98+U4sZVZ5HYpljRyBHgJcAX
	zwykw9g5ZhSr4pugGFCtPcF+l8eQZDmQelpTbCjZ5oL81T8GiBEvwxxPPbGQkmuG9L6lXr+xbCB
	LuneVMoooMei0GwV+OUx+qHONMmyeCbH1on1WHcC6WFpRSabZBHow3d3eX4xxqkLrziq7L3MBF2
	UKE4JdmG71CTb+fScUiVDnNr/vqcJEIhab85RMx4QPcOBfQfX7ZxqF4kH7y0+nZ4AnbuTcNCQtN
	kM0pctlDpsTqCLqUGk6rsFqsiklX1utVYz5nkEyz9JFIhkgkwpgNd9pa/0338qaqzQveqBxrF4v
	oZPE8RszgjUlp2dfg/Pf4ZBUCqaaFqU5fo2NhhruavV2yDn5322+kRBDHRmus/fIG9Ft1XLcGR2
	5dlNyU+ey6dfkyTAKXa2AGBL7Hn3Nh+/v3PZX3ZB7qtleFIvljconP
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id
 5b1f17b1804b1-4a18eb4483bmr286389355e9.2.1791925660275; Tue, 13 Oct 2026
 14:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 13 Oct 2026 14:07:28 -0700
X-Gm-Features: AclHuK-BheBwPa0wu_bGJfIf0QRgUTJ9CBEgZWAxAmPkomjPVar_Q74zd4MM7Cw
Message-ID: <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH=3D argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
>
> The duplication with the main Makefile isn't ideal here.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++=
++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/se=
lftests/kselftest_deps.sh
> index 487e49fdf2a6..70b834361cb7 100755
> --- a/tools/testing/selftests/kselftest_deps.sh
> +++ b/tools/testing/selftests/kselftest_deps.sh
> @@ -10,13 +10,20 @@
>  usage()
>  {
>
> -echo -e "Usage: $0 -[p] <compiler> [test_name]\n"
> +echo -e "Usage: $0 -[p] <compiler> [ARCH=3D<arch>] [test_name]\n"
>  echo -e "\tkselftest_deps.sh [-p] gcc"
>  echo -e "\tkselftest_deps.sh [-p] gcc mm"
>  echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc"
> -echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm\n"
> +echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm"
> +echo -e "\tkselftest_deps.sh [-p] LLVM"
> +echo -e "\tkselftest_deps.sh [-p] LLVM ARCH=3Darm64 mm\n"
>  echo "- Should be run in selftests directory in the kernel repo."
>  echo "- Checks if Kselftests can be built/cross-built on a system."
> +echo "- Compiler can be given as LLVM to use clang, as with LLVM=3D1 in"
> +echo "  the kselftest build. LLVM=3D<prefix>/ and LLVM=3D-<suffix> selec=
t"
> +echo "  the clang binary as in the kselftest build. ARCH=3D<arch> select=
s"
> +echo "  the clang target architecture, defaulting to the host; it is"
> +echo "  ignored for other compilers."
>  echo "- Parses all test/sub-test Makefile to find library dependencies."
>  echo "- Runs compile test on a trivial C file with LDLIBS specified"
>  echo "  in the test Makefiles to identify missing library dependencies."
> @@ -53,13 +60,32 @@ while getopts "p" arg; do
>         esac
>  done
>
> +# Pull an optional ARCH=3D<arch> out of the remaining arguments. The
> +# environment is used if it is not given on the command line, as with
> +# make.
> +args=3D()
> +for arg in "$@"; do
> +       case "$arg" in
> +               ARCH=3D*)
> +               ARCH=3D${arg#ARCH=3D};;
> +               *)
> +               args+=3D("$arg");;
> +       esac
> +done
> +set -- "${args[@]}"
> +
>  if [ $# -eq 0 ]
>  then
>         usage
>  fi
>
>  # Compiler
> -CC=3D$1
> +case "$1" in
> +       LLVM|LLVM=3D*)
> +       setup_llvm "${1#LLVM}";;
> +       *)
> +       CC=3D$1;;
> +esac
>
>  tmp_file=3D$(mktemp).c
>  trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
> @@ -178,6 +204,56 @@ exit $?
>  }
>  # end main()
>
> +# Mirror the LLVM handling in lib.mk: LLVM=3D<prefix>/ or LLVM=3D-<suffi=
x>
> +# select the clang binary, and ARCH selects the target triple with the
> +# host as the default.
> +setup_llvm()
> +{
> +       local llvm=3D${1#=3D}
> +       local llvm_prefix=3D""
> +       local llvm_suffix=3D""
> +       local clang
> +       local target
> +
> +       declare -A clang_target
> +       clang_target[arm]=3Darm-linux-gnueabi
> +       clang_target[arm64]=3Daarch64-linux-gnu
> +       clang_target[hexagon]=3Dhexagon-linux-musl
> +       clang_target[i386]=3Di386-linux-gnu
> +       clang_target[m68k]=3Dm68k-linux-gnu
> +       clang_target[mips]=3Dmipsel-linux-gnu
> +       clang_target[powerpc]=3Dpowerpc64le-linux-gnu
> +       clang_target[riscv]=3Driscv64-linux-gnu
> +       clang_target[s390]=3Ds390x-linux-gnu
> +       clang_target[x86]=3Dx86_64-linux-gnu

^ should this be either i386-linux-gnu or i686-linux-gnu, or does
`-m32` get set somewhere?

> +       clang_target[x86_64]=3Dx86_64-linux-gnu
> +
> +       case "$llvm" in
> +               */)
> +               llvm_prefix=3D$llvm;;
> +               -*)
> +               llvm_suffix=3D$llvm;;
> +       esac
> +       clang=3D${llvm_prefix}clang${llvm_suffix}
> +
> +       if [ -z "$ARCH" ]; then
> +               target=3D$($clang -print-target-triple 2>/dev/null)
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnable to run $clang ..."
> +                       exit 1
> +               fi
> +       else
> +               target=3D${clang_target[$ARCH]}
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnknown ARCH $ARCH for LLVM, supported=
:"
> +                       echo -e "\t$(echo "${!clang_target[*]}" | xargs -=
n1 | sort | xargs)"
> +                       exit 1
> +               fi
> +       fi
> +
> +       CC=3D"$clang --target=3D$target -fintegrated-as"
> +}
> +
>  all_tests()
>  {
>         for test in $l1_tests; do
> @@ -285,6 +361,7 @@ print_results()
>  {
>         echo -e "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D";
>         echo -e "Kselftest Dependency Check for [$0 $1 $2] results..."
> +       echo -e "Compiler: $CC"
>
>         if [ $print_targets -ne 0 ]
>         then
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm =
master
> change-id: 20261013-kselftest-deps-llvm-51be8d160008
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
