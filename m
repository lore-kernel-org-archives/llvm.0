Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B55389E08
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772080574; cv=pass; b=WH2E1nBqC7oFKXuKCKOp6H2IA9uP6M2r7lE1bnl5sK/yhLmDRfeiQTeoG0vd5yX4bAtdjaYDRDkJFxm4q8N8Da+K/4t7gQiJOzvabsfTVrecKl4l5wnNIhX2TUxEpz8DeetJcqqfh08eZ0QEzDXwqfjITwMZlKgfkNw0i48qyAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772080574; c=relaxed/simple;
	bh=yQ56y6Fx2X+yAbYgVikepnfFcZ+Sxypi1uShKXPHDHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6ryK1bGJ4qbYZBExCZE54RX51L2UC+1D1SpYWT+ypF5FrDLQSSCwnzZT5efx/qIX1BK/y2iy1KcZEF25uIs4ukIinx1mmf91a6IwqhwK1UFWDmW4s1/UcH8bXNFr5jlSvkAYo47i5GG5wZiOMPCWlOnOTJOBwZmLqIfxm7qkZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFf3xfbX; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFf3xfbX"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986fb839f5so3680857b3.0
        for <llvm@lists.linux.dev>; Wed, 25 Feb 2026 20:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772080571; cv=none;
        d=google.com; s=arc-20240605;
        b=WbvU94kO2axm10LASYhTuEAcNN0iSyMJsQf9akeZaQ0aQ/i+7/6bbLrWGxrpV14lg4
         pjYBkT2KCEvqKFhwaCnJ4iPTDWxXX/ddu8A0ot2TZTPBOeYmNNOm+Mq+61fUkEJzOkjV
         SRD/rsibDS8xJA03nT3IT0mDii4FBrxpgAAt55bA5RLg0146cVvOUtdZr2z+lrO7JIpf
         h+hAIf7T+PxEguSF6xT+7wWB6472GQHCJ0VG73clu7l97aQE/0dfgXjuJK+pP07gHfDu
         6A9j0rAXa5IxueXc4tZnyEvWzhFEUWlR6NRbFNlkTGQvy3oKlTPIqA1BFBxqFsogYVRN
         rJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        fh=kbcwKJIl77ia+C1pgzDsJJjiFkIGL2zq82sRP5K09kU=;
        b=eAxUtSsVL9+gblMNXZFqH3HwDWwzxTILCHx3HOzux/Wcf2rPEq/diPNG63yyuTEb1D
         6fcHl0wq7SLqDu2g+RXrAmvevb5xwQ6BilECMycGgu7I+GvzkTWvIp8txMOOrkf/OOoj
         iYnzZRN/WtzRhHrVrnQONl/3mPDa39ZZpOYG/R5RQir+T3k1UXVh/7iF4PYqlVo9E8u7
         JMokwYFh6Nin1z/LZNM6PFyQfNagL78eBYwTTPGSFBIRC+HT6CQKuRB2bGArl+JhK+0/
         iW2XazHsg7s+YW8Zn3n+JJ8BLqGCA1GOptcT04lTVyaW8t5u7jYUxarLqq4wETEhteYv
         zIng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772080571; x=1772685371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        b=SFf3xfbXRWSCt0dpG1yWjVcTPHUnrcD+jq0ekDC+apTL5bWQMYjCL0TSjFYgo3y6hu
         NYEeVk4tT+j+//rmZnURCqD5up2XWPfv0rXvY5AFceNIKF9PvKtv+8wyqpNSp/o97lfK
         uCDkpApaEl2+ZhOrRf3qY5/jcDKPai7jCi+r4LAi28W5xMoTrcbY51jzO2lC4ZOfTMDF
         E4iPplI0w2ebdZukkeGhFa+vB9N2P4gASA8Pz8RXwXgE4AN+EWB4gAm8sonPPWagOLXK
         jzPlRY5MrOyZX7BMwj0r2rfPPPtoqBEp3USouMAX+JEU8e0jKiqKdRz7xAtJFVYDypIQ
         tVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772080571; x=1772685371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        b=Xt5GQ/ZsbIx69HcZ5mqi3LbwAb7o94+f2LeHaR+FE6gOpI/62wKVmAF9RLL6aQ62c4
         TNTRZ6kMddbjmZ6Az32M7oou31stIMHT+5hprRi7vapP5FxPOFIgr5IF1C+Q0ffscPq2
         I2IaHvXEBC42bG8Y1qkvcg/WWqc1uyFw18Q6yp/E4su5puZo1Zdi+mTeK7tsBQnqG5qO
         9ITkG+7pwKrzHt3E/AuaCBGmm7wjxlrzBEjCN1GEHiQrqkKfQegoJ8vsI3C+QFdoeEhr
         gfk2+Rt+Q/AaedUe9qulklsKYhu24shdlTgy2awTtTjiwZW0r+9KY7tESMyhsFY3zMam
         atiA==
X-Forwarded-Encrypted: i=1; AJvYcCXOstUNsWrDqVWadC8u7Qg3148fVqF81B219/G4O16Fhf8plf5ps9cGLWOmNI4PIfCTqkDx@lists.linux.dev
X-Gm-Message-State: AOJu0YxHa0sDcBk08WUAMqWLK0H9h4GXvk64IsKkfyqviDoinO60yS8Q
	y7yQbY48URw76wNEN9KX57kwoVUdoNTtXlRDGEXuej1zM0upJBUsKUXfUV2HBF6RD50OT6AMgdL
	6A1/ia5m8UZzwtvdWqiTNa2nGG1A7p7w=
X-Gm-Gg: ATEYQzx8fRZ//lAcIOkPwnX9x7ETE6b32W7K3toPGKBGA7e1JeDEARSDNkkmLLfeGGO
	lM5KL7x6CV8cbcoxz6Gi+QJOCfypdBXri774xEX9QqHdBdAFugYmM3wg3xq5kz6EkdSKlEAYUFo
	NiHR0MOOq7qHA5cMG2jGD23E+f8YdTqz77vSTuirhywFtwdtbo9mN4KOy/VQYH8PpPKrAzuRhWA
	JtuLaaD6nqrWH5wV1M51bC8FepvOM0CAbmJosIc1r0znCRyNh4aVw3hyAxMmxiQUZEp0blls/bm
	1VVCRYmfuBdOsyvR6iwQNzEBdA==
X-Received: by 2002:a05:690c:c4fa:b0:798:7498:4ad7 with SMTP id
 00721157ae682-79874984d90mr12254757b3.62.1772080571229; Wed, 25 Feb 2026
 20:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
In-Reply-To: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 26 Feb 2026 12:36:00 +0800
X-Gm-Features: AaiRm50kzO006Lx2eXxr-zZ4lXv2cILNCfMV8z8b79sYC54jP5X1Cub2Op14EjY
Message-ID: <CABFUUZGgnKF+C7f7yPkXybFq1KBOJNj3s73R41ru1+aGUGYUQw@mail.gmail.com>
Subject: Re: [PATCH] genksyms: Fix parsing a declarator with a preceding attribute
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 6:07=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
> with __rcu"), genksyms fails to parse the __rcu annotation when building
> with CONFIG_DEBUG_INFO_BTF=3Dy, CONFIG_PAHOLE_HAS_BTF_TAG=3Dy, and a vers=
ion
> of clang that supports btf_type_tag.

Hi Nathan,

Thanks for tracking this down and for the minimal reproducer.

I've noticed the same thing while building on my laptop during MODPOST
Module.symvers:

WARNING: modpost: EXPORT symbol "nf_nat_ftp_hook" [vmlinux] version
generation failed, symbol will not be versioned.
Is "nf_nat_ftp_hook" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "nf_nat_irc_hook" [vmlinux] version
generation failed, symbol will not be versioned.
Is "nf_nat_irc_hook" prototyped in <asm/asm-prototypes.h>?

>
> diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
> index efdcf07c4eb6..cabcd146f3aa 100644
> --- a/scripts/genksyms/parse.y
> +++ b/scripts/genksyms/parse.y
> @@ -325,8 +325,8 @@ direct_declarator:
>                 { $$ =3D $4; }
>         | direct_declarator BRACKET_PHRASE
>                 { $$ =3D $2; }
> -       | '(' declarator ')'
> -               { $$ =3D $3; }
> +       | '(' attribute_opt declarator ')'
> +               { $$ =3D $4; }
>         ;
>

Your grammar tweak to allow an optional attribute before the nested
declarator looks correct to me.

Best regards,
Sun Jian
