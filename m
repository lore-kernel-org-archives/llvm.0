Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC1B3ABD90
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563442; cv=pass; b=TxrW4yuKnhef3ho8MkLpc9g1MsJ1Khy5vbtSVk0/p36vqY97P7lHct6zLH7QjLzeZA7OagljbxMA6Z/hZqwc8hM4L+2xgfrNcnev4pTDXuE37uCtD0h4VBvtEROEVNC8PfIsjp+BVotKSXU0I0Pkfy+XMDj3k99lv2kwUS40rk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563442; c=relaxed/simple;
	bh=LqRnFrlsVSN6Z5AojpUM9t+oOQCqUIrL1z0I/VtoBLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8/J3tuHz3ounAvuELzCxRYubJPokVX3LzuMMSXY7QgXQ8wBf5Fi0rxB3pRLONgvvkb/xrLfQKYWt7RRVmoljqAOqE1NYT0KuLZ64dn/VlnTV1Zat6F1jrXhuRylxbE9GZ9WbqUCVV55ssz8+4DSn25fdRBJYgZF15hgGnNQ9j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q+Vi+EHC; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q+Vi+EHC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68cb445dd5cso2420a12.1
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 15:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781563438; cv=none;
        d=google.com; s=arc-20240605;
        b=kvz//VJ0uFo7QQ8STOmYKBwl8CZ3YEqpjrtwk6Vv2gotL33PNAYXUrQfCbXFyihhyH
         fAbMo2lzGGm2pOXfrolbYzt00C8lB0wOQ9T6X+3OU7XE55h3EtSCpI4BcPM1HwTYJu/W
         eyzDFoAYivV7Cz5t9j8cnkpv+UFoS/q9jkMnaRczvnPqudQGJ8d65Ip7FB7zo/e1k1QO
         NbWDovmP/4Dsad1vihPyOwttIezxHNPLl+PeRNaUaDd6bKacKp1N50FtlO7/WNSciweP
         09+8rrJZwPEVuczAZXGUf6md+0aXvChIf4SbpiGQynGQZe6yZm09Wk7+Vpjea3d36XmG
         1w2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        fh=fx7RM32cZD34MEzfnd9idZ1kxs3wlYsnqBi8pMkhDks=;
        b=eujWvN34FyiVGVVn7/cQHAuAxwaOOD7RcLdtecrt3v9PgA4IuZ5ydmNKnh3klD8jL+
         nHeQWrvJpaHXHqCufbHkItXtlpiF00sCTQGuYAn26dpcoLgFA51JEiGTNwn1OACF4Pmu
         c+c3pF1sK8ngYMH6QwN89WvuSjNyoCEY7+cvTgcS2BF7GD+MZgqdxqB+PFB7OK8nMe/g
         kxsZXb+n70d0bt04qXKrbD789b5iawvHKIzBjiUPf6tC8ZQhWqzxPgGtCJGUPFjJrbGw
         q+ksUikBd+xgI0t/Sj8OxTkXucacj3zqUv1Vk4wchnBfPhBO0gos78ffwlDmP8OviDem
         1MCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781563438; x=1782168238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        b=Q+Vi+EHCyWL0dTPVeaUsv2pm4rKdnOuvqfQUfDa0anhaJF4Fl1zB/0p/xKhtxA5Gzi
         yJGlVX+OG49c5sh6lzghqr05W8NAntMKGOlvpXuKdIcviNEZyxweQjPoWlRJBNa294rs
         DMGMS1WXxp2LjC06jRwYqcyOcc8GkZo1nRIquYoeLD7oMtaLNvhjjVD0+epnzItZK87J
         YDagnqNFuZDSGd7HZwryia8ijux7kBREumoPI4cErzlpRt6a16gsWxgwfQaMo8lTaI3V
         4jWXkDTKuL3bHdQGNEBZargggfxaQr5zmZCjWBGdKMEdwlNA6dM/3nKyIZlfdfiSok2m
         gzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563438; x=1782168238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        b=QeHd0dnpa8JmRr2P+T13lGHovOErw6YhK7NvnIsH+mUAujpCwZEVQyUXHSnIg+vzm3
         HY76gksIyFmQICUI4/cJ8Yl14dUilvgst2VSD6wYXXuBWTOrU3ROqm9qr/SJprTsA1vw
         0b3IH3b9odmKNwqffRVbAF9XuC/xCefulWLfXeBX+uRMdFsFd15vEgC9wLEsPqcNwZh4
         d8UTrwTt3GVXKNv7KSs0zLp9Z7poqOxU/GNtuz5uZ2OZ6o/WrUoxzk6aqGtaiZolzs3H
         RbHnNe+/6PHdH/Vhwhe2u9GuVTGQPgUFkiYgaRk2r6/oOYVaey6P8Xi/xeXKuJJVyhgD
         qcAw==
X-Forwarded-Encrypted: i=1; AFNElJ9wL9lVaqmhXCXAfRAOE1GeLvBArtJ/9tbVFr9HfOLbvuthfgYV63FOtIdunTPrL6w85G14@lists.linux.dev
X-Gm-Message-State: AOJu0YzIvlCBQT1JqilvqASZLfiCBPxHNW469AHw3Of/BpdyndwLNy47
	IcWJIa69SFgQb02yNwsAUvtajlqTHj3MJFBubfbLDjmqvnjaM51xjPjmGNFoqvJUL7nCcMLke9j
	zjPn5tMM6/oQe2oAG73xmrbaodhNJFD67PpqN5Kdc
X-Gm-Gg: Acq92OGg2Nj7hVhBQxqP11lHIoTT0YDmUTVCfEwLlou9zpipNpKB52kJJw+Xuz/jMoc
	4JBQwgZreRdgwKuSNVFG/EKsAOOQH08Zz8kGl4sp9GYE/VBPMDQbgb4hpSCdbXn84R8BqS8gQnc
	HLcJHDxMGhkhGuoMC1ySbqSQgv5wtFaKcIjo6ezHQrHQJcgqeFIgEqDykxOE3XngAZJmz8rQLsj
	ujYzkO0ODdjqMeMT8jHv8qQC0gT/5I+VfsMr9M9rlOibVFFzn+IyweLj6/WeRum3a5wD9Qm2qb6
	19M8/I3MhQijYPS5E99CW6Azh9oG3usyZfvkjA==
X-Received: by 2002:a05:6402:a21a:20b0:671:dad9:8caf with SMTP id
 4fb4d7f45d1cf-6950f6d13aamr7823a12.5.1781563438075; Mon, 15 Jun 2026 15:43:58
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615222019.4116687-1-xur@google.com>
In-Reply-To: <20260615222019.4116687-1-xur@google.com>
From: Rong Xu <xur@google.com>
Date: Mon, 15 Jun 2026 15:43:46 -0700
X-Gm-Features: AVVi8Cdx2-FNEk-6V92cqNAvXpfnn9AuqvdTdLKhdKePA0rbNDur1QbFJ4SR_10
Message-ID: <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A more direct fix for the warnings in
https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
looks like the following. But I believe the solution provided in the
patch is more comprehensive.

-Rong

=3D=3D=3D=3D=3D=3D
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..1f0a379b43c8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
const char *fromsym,
        /* symbols in data sections that may refer to any init/exit section=
s */
        if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
            match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
-           match(fromsym, PATTERNS("*_ops", "*_console")))
+           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
                return 0;

        /* Check for pattern 3 */

On Mon, Jun 15, 2026 at 3:20=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> When building the kernel with Clang ThinLTO enabled, the compiler
> can mangle static variable names by appending suffixes such as
> ".llvm.<hash>" to prevent naming collisions across translation units.
>
> This name mangling breaks the section mismatch whitelisting in modpost.
> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
> safe references between permanent data and initialization code. Because
> the LTO suffix modifies the end of the symbol name, legitimately
> whitelisted structures fail the match, resulting in false positive
> warnings.
>
> For example, a static pernet_operations struct triggers the following:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: \
>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>   ping_v4_proc_init_net (section: .init.text)
>
> Fix this by stripping ".llvm." suffixes from the symbol name in match().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@i=
ntel.com/
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/mod/modpost.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..1f5a64eeb048 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, El=
f_Sym *sym)
>  static bool match(const char *string, const char *const patterns[])
>  {
>         const char *pattern;
> +       char string_stripped[512];
> +       const char *ext =3D strstr(string, ".llvm.");
> +
> +       /*
> +        * Clang LTO can append .llvm.<hash> to a variable. Safely strip
> +        * the suffix so glob whitelists (like *_ops) work.
> +        */
> +       if (ext && (ext - string) < sizeof(string_stripped)) {
> +               strncpy(string_stripped, string, ext - string);
> +               string_stripped[ext - string] =3D '\0';
> +               string =3D string_stripped;
> +       }
>
>         while ((pattern =3D *patterns++)) {
>                 if (!fnmatch(pattern, string, 0))
>
> base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
> --
> 2.54.0.1136.gdb2ca164c4-goog
>
