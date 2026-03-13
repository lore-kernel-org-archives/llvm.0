Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4C21883E
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773365292; cv=pass; b=e2LlIidHEWq1+qQAt6yxTJc9VLptr3fUfBdfe3j8N1kc42R0W38FI6NNsIx1kyP5dR2rAhvMXj3yLJLTF7R390RVD1dan1enviKMwBVsJ4Km53IlCW0NDTjII4JVEDxn7Tu4nvTIcJ/E94+Wm0PIVmPXYLGC598+VCaDLJkbF10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773365292; c=relaxed/simple;
	bh=VtHWvwO/oN4aXUGqbz3E/U5WSlrRx50F+FHZCSlge3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4txECPoUUKgT16OSDHt/qlz1BKhIEVdj2lM8xf4Z6hE4BJPrkx3znzz+a3Cvy86LB8kBP1BL1XzH/nnPLIcHAY9hDhQDHuRUBCxpf9yrpjmZvdDJJDI3Yt4XhcN+/xkiOPxxTu7Vu9+UrbMs9Jj95GTc2GKmpyqk97/dfDTx0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eww+86Or; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eww+86Or"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485344bbf1fso34255e9.0
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 18:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773365289; cv=none;
        d=google.com; s=arc-20240605;
        b=Er3CLrqHUHC1/eLUCdtDnYgYymFH8FApEFNYDq5rKEz+qtb9h2Bfa01g4W2kp2tsGK
         2brAHADioHkeBb4j0MgEuct5go6LA4rb5vfualT1sOgpdwFdQow6Iwka/FvDm2pGob8S
         sDFM2zt78wDKECEJanq/WUIVm8MP88V0GeviCb4Z5aK52JvrzrZ8rb3gaaDYqzAQxzN3
         T90y+6YbcohL/ahoocNps7Kt1dYOpt0s1IaOkw0aSzxxSp+9DEsdDjCezChXKdbNw35V
         wuO4ft9pRurlxC59L2YGMWCbY0/ZyMXEY+njBxOA5knZeYeLL3Lgn7o8JLm2P02EdCSr
         zkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        fh=0ZZX6/gUTyYGQu+h3o9UpdlQHwsxbSfjAQM60Eupv+k=;
        b=Ieur6OsJUnN6NVvRbtrHyy0vykeW10SCkH8jlSrrY84Q7OivQ96xKDcnG/+01lRpBe
         DS7uLIKiFz9PDitJvHkrp2NM4DxaIpmkoNy76EBQGWbwoIwKbHvnEJVJBtnnxpTF/gZY
         6D+cvov/6V5nY4tS01paRxTezN6R35tEXbLJeDz2VuPQG5xdrE+RTcULF3eInmg987hC
         vIEkVywvXaocdfah9vr+4Yi10niq6zQ8i+FUXrQoY9kz7wp2cjoSH8X4C1M7kvaJUbOi
         ZlLfiKIGSZM7ZrRsMHSF6BAdAc/y345yVSjJ4CozdsdwXbiXxAdY7sqUz5NBfZptXum7
         +Hyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773365289; x=1773970089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        b=Eww+86OrtqdeqhRlsEYMebhGjXuhVsQ2cXYY4+PxXvQXLaJrDk4J/tYETEteO0aHQZ
         a5P7HDDHuIF48OxTGqnpxgSEp0JnvDMvP9799BnNIYudFdYvlQxtDCYCiEX+lgwsUHVb
         WWGtpiJ4UHsJpGTdMZJ8lHCaqhteqnA2+TLAIN4lM8bUjLcLQqzjbSovWfYbMxJnsjuM
         IcnJMCOVQ/s3Q5HJFBowsIxEODDgOwBBdp8IqNQQ2ogVbyBHUGOk7nPktaelA1tpUE4j
         feFxNre2gXXpS0cVVuH69csjT+EJpkXKDGefnjt4Ojj4qWlF9Eqq5Pcuxp5JjUsfGlv1
         fQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773365289; x=1773970089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEobTUWzV72x3QN0OyxLx+2qJJC4Ut4A452RWli3N10=;
        b=gRwIR9qUAMYuuCAO1TPL4TwHU3hEbundYGwJ1Qd7piyh9m3XgH/RabbvTUdMBqwiDP
         db5zXgodKhhqbBs1+trYQeyU+HaKJEjq2q+aC/ii4alQ6pY26u//a+peK/yNZmoUgVNn
         et22SZlB6WFbHin4WNcFCo/GObxsT0cAkxfc5EMJfbUXnAh/PVatvTysXpLMVMxSiOLe
         Tj5Wl8aQoABVl0bozxF5UyCgYszcu1prMQ/FAAMb61XPrtxojmZ5zIOrwWguhQfWIPH8
         PLHY79iit1lkU/jjkU3xM4Pya/yTdaHAdpE/nO2blLbyIQyL/jIJ0YoCyxi3qHJlnl7y
         2Q3Q==
X-Gm-Message-State: AOJu0Yzxec7EQ0oADBwi7KJ/5f373MX3ZBpmwRmvtP5WAYo9S4mjOh+l
	0n+hxqA+Bo5CxvYnLa9IhWE1Cb315BIKYl+67am25QwJD29V2SXNozuA5NUw4ObddwC0ul4WRM9
	Zk8nP/VkP7Uxheblaskpgc2aZd+pot5JP6B8Ygo6c
X-Gm-Gg: ATEYQzx1kfe4gW19Rtx55WhST3wWBPnWfGG5HhF36C6K5vgOR03QK8kNBJhhNTMWVph
	IET3P3x9WVfI/sHqIZD6e/8l6JdrmxUpG28uudaCOXaIR9onWMbQ7OiUNjoBaM8qH/8Cnlf0Qyb
	1kmWZuiP2U/UobSOGkNuQfYL1YorUx+DxS9wStLpI+ZzrqEdY5N9dSV6Wz+ZOMhQyz68EOVry/i
	6LwtUPagk5fEv8zMBG576m/Ei7QfKroEcLDXnjubuf4TopZkSiOxX0Mv6mtJjDGt/DtiyF2lBdU
	kPd0cavPQacxCls7LyYj6qe99fiJC5s9sQV69g==
X-Received: by 2002:a05:600c:c04b:10b0:485:2ab4:c1f9 with SMTP id
 5b1f17b1804b1-485566dda57mr433185e9.4.1773365288441; Thu, 12 Mar 2026
 18:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603130112.2FcCzv1g-lkp@intel.com>
In-Reply-To: <202603130112.2FcCzv1g-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 12 Mar 2026 18:27:56 -0700
X-Gm-Features: AaiRm53g-8e0oyPHvXegj0peU0NciplRf_c68Z8P5NPMptU5ZE2b2R-E8zmaE18
Message-ID: <CABdmKX3PLUQmm6cHJqhst=ifK8dvKgKbfgMyR28YLF23zHhZKw@mail.gmail.com>
Subject: Re: [driver-core:driver-core-testing 3/16] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:46=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git driver-core-testing
> head:   e7ccc9e054beb4c366228d24786f67c738206605
> commit: eea5d2bb34ba11dccd9c53f392dc50cf060150a9 [3/16] kernfs: Send IN_D=
ELETE_SELF and IN_IGNORED
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/20=
2603130112.2FcCzv1g-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260313/202603130112.2FcCzv1g-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not desc=
ribed in 'kernfs_drain'
> >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not desc=
ribed in 'kernfs_drain'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Ah, yes. This will fix it. Greg should I resend the patches?

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 715b651e35a0..7f355316704c 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -481,6 +481,8 @@ void kernfs_put_active(struct kernfs_node *kn)
 /**
  * kernfs_drain - drain kernfs_node
  * @kn: kernfs_node to drain
+ * @drop_supers: Set to true if this function is called with the
+ *               kernfs_supers_rwsem locked.
