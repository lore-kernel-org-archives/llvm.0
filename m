Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981AF3C02
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 20:34:56 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id pq16so13500014pjb.2
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PTbWVXLIN1b6HbFAVFkEqMwwHS3zVwHlY2drFLxGoLg=;
        b=o+Bp92d8U9IeEnBkS0Z1i9ryaMDET3isngOzJ4EcKfV2O2TQauCy6hypPz4oiOa55F
         0Xmeg/1n9Xud7HFz871iXBLNsCS+2PNfYvqmVDP5huXQTcfztJSaRqh/2dYaBPHK96sk
         j7oFvVh7Q9v6rhdo2VzhzUMulsWF2mN+jER4PxXhS5ZDgKSi4p1kkc5oNvmixzLLnOwf
         kWF0hrSjQL15Oy+AZXe9lqhI0IkSzGb9iUt614GV7U+qwumizxLpx+ltMWgCd55kXmi7
         5ht4TyF2NUibWetksITA/5ENHjDRzdITqN3mQ9xjh/q6etDmd2NAM/VLIJN5YnR5jYVI
         HWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTbWVXLIN1b6HbFAVFkEqMwwHS3zVwHlY2drFLxGoLg=;
        b=pKTwbcwHG5cXnDPqxx5hR9eay3UgkWhQEXC61aaudZaK7hpztGjhdw3tubUQ9LlJ3t
         mXZpFvn3aZnncmXCZWWhzmqloLbtB8tLAHkPEX2socXJLu+FDEkvCgNDVqCk2xLrUgZH
         XTzXmJfVVsWRhLsycAfgj9HFCVvnv1y8tFQ6N63UqKSdTSf9pAFgGHY88NPeT0+exPtx
         OzcTBrBPErHqTYglix6WGCyTsgj6UIrsXGgL8qR+TowhFDJlBeOGulh8SnKleAkJgFMR
         B0QU0TLVhTKRM49LlX73BfBWehy93aIsHh28ygcM6NR5NtkvV9vRBqFlN0Pji9WpG843
         wcvA==
X-Gm-Message-State: ACrzQf185E90S30jvYHmxgyHznEV+iN8pQNwHoyV+38K2Go3E/AlDH3F
	OwGtF9LGxIlkqMuvVzxj2SFMlZAFhcoya9hsbNpeBQ==
X-Google-Smtp-Source: AMsMyM4OgyVn6oWkRWJzsx5ZmJ1iLdep7BqJmP/vTlKH6MkCP5Hv7iJHLNDobooF7Blmg+fdszART4fHQNyJNqMNKIQ=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr25348875plr.33.1665520495825; Tue, 11
 Oct 2022 13:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a10e25f13205cb96e1ad63f1b1371a76f37af549.1665515051.git.quic_gurus@quicinc.com>
In-Reply-To: <a10e25f13205cb96e1ad63f1b1371a76f37af549.1665515051.git.quic_gurus@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Oct 2022 13:34:44 -0700
Message-ID: <CAKwvOdmsjxB_i=9Qy6L+4AH+CwOYa0EsRBPFUTj9vwxJ6vNPSg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/clang-tools: Convert clang-tidy args to list
To: Guru Das Srinagesh <quic_gurus@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, John Moon <quic_johmoo@quicinc.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 12:06 PM Guru Das Srinagesh
<quic_gurus@quicinc.com> wrote:
>
> Convert list of clang-tidy arguments to a list for ease of adding to
> them and extending them as required.
>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Masahiro, would you please be able to carry this up through the kbuild tree?

> ---
>  scripts/clang-tools/run-clang-tools.py | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index bb78c9b..56f2ec8 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -45,13 +45,14 @@ def init(l, a):
>
>  def run_analysis(entry):
>      # Disable all checks, then re-enable the ones we want
> -    checks = "-checks=-*,"
> +    checks = []
> +    checks.append("-checks=-*")
>      if args.type == "clang-tidy":
> -        checks += "linuxkernel-*"
> +        checks.append("linuxkernel-*")
>      else:
> -        checks += "clang-analyzer-*"
> -        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
> -    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> +        checks.append("clang-analyzer-*")
> +        checks.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
> +    p = subprocess.run(["clang-tidy", "-p", args.path, ",".join(checks), entry["file"]],
>                         stdout=subprocess.PIPE,
>                         stderr=subprocess.STDOUT,
>                         cwd=entry["directory"])
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
