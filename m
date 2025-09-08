Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9E2E0B5D
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362765; cv=none; b=IVJhhEZ558MstKkvkkvuzJNqNZCvxVHTotMrCSU1YSDT3Ro1PyOVx46q7Mp7Kslqqq9DdVUZNpwoh8tUZqEj477JzNgSiwqSbFlvmfLWTOohAsG1xmb+lcaSI+BGHnjps0IW1yeyrZCwmP0FRyiBaCKRoD/M7ENecsQGMJKizWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362765; c=relaxed/simple;
	bh=tQubbYkSPmW787uMDk/VjL70hBJ1by4E32yNlzWShJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AibYr3T8CrjgXw3tiGTjvndwL6nk5upPXcIslszeHgL/r5y7ZS8gyXmYjTq4Txx5i0VwSDebvURkwQ4XkebUgtydowao8mYV481rpVG7Y/xcpePBdAhSbAx+zkjNSxPm1Vvb0zRNAOMhG8QyJWuRQ0eXKpxF9lHLPhCxrXfrwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpEy25Uc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpEy25Uc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso31453855e9.2
        for <llvm@lists.linux.dev>; Mon, 08 Sep 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362762; x=1757967562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK9/DwHmthANAPoxGvgtMIu4IcfAIwwBdfEzyf7aCYc=;
        b=EpEy25UcPQuIW90A84EzUT2/CWhJj0P2h5qH2ZMiZZPt25jxm5fLgdzCLSItVgirJQ
         y+jrwTf1JL2DvcigKFke3371ME+3IKrY3g4KT7wsxy0YlDNzV9pZhuZrYnCxfzDSgzBf
         0PJrN3svHNBKyyLwXUOtny9BLoH6FroGF7YxGzv8OuFA9epsDZyZGKqWcntPrq4ahYrP
         5vOjCUWvEDT6fszTnZm71d33IvRCbhW6rHz9SZX3nN+0N2i6v7Ehbpo4DQOvmLtpIWB7
         DZpf/RWtkZsJEJYLpkBg/iPiGtqWRoOjTGGHZMOz7I3lkf5RvLP4E+g8Ksc/FdPhNuFk
         kJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362762; x=1757967562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK9/DwHmthANAPoxGvgtMIu4IcfAIwwBdfEzyf7aCYc=;
        b=azlhgVWmZls1NxH11+qTeAzUgTPSvIV3nC8nI5aL37MEt7+o0sJi5mJ7r49/HGLzLu
         mYrubG4qtC3nh5SxFTpBytxFvnkTd/4tDo+UpozYseRr4r3/aNZPLWz5+i8kl+cqwRS8
         iXy0e9YEb6oqjlyn4rk6PWALrSv2ZO/d9dIjm/XWDxj1ulO+42Yfi5PkitwNojpu+dmg
         QJzAYAGT7mcc/tnrKbgf5jgv+chfOLUQ3o+RCNyPZ0Zt1QzH1gzCVkGOxh7zPTCl0HcI
         8MerUKSkqicAvCDeAT+dS+uKzY3LRSuNHgjYR+mdaxfMdVNLZrPF0o7XweWNkWDQCHTZ
         RVQA==
X-Forwarded-Encrypted: i=1; AJvYcCXz7n7+YSy65BPp3mPk8dUPfXOHWLSTegZ+VzZj85ptCkBF+RadR50dY/bOv4/Sl4k8aiLh@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2WOLcD+0y111HJUN8AskLLSv10GS8xTa249ZvM0fnSvsozEpz
	lE5Qehiz2RoVko3wo7VDRCUDzvdMQQV5TGh6iRazVpDtwkqGJvdrwcgFn5OpzcqPbiPlDlM6kZg
	AF3a4bh/khuQQs+HillQf2SKYXJA+Dys=
X-Gm-Gg: ASbGnctkkWxJJWAtBBSMnvCyrBbEkA1J18m2PqDA0y8bdlPq5dz2YGGnjPS1GcHbh2p
	GU/uDMvh3nW1/rNSk4F6tPtGTXWsHwg+b+LbFvCHOeF02Zn1VDIRG8DLKNK8aqEduCZn5dEd54X
	kty2oylJPy5+5opmVNTbSQ0M3BoD4nplFqEuZng0Bph9oKGq8PoPOhkXqPTeKvQaLcrzmvGoZny
	YXvf8vN44OIeNDtMVVviTzb/OiqzQ==
X-Google-Smtp-Source: AGHT+IGZZE8d/HSpoC7P4Nb+5HTeJindRu57Gsc+Nhd8qWOwEu57WmXSWCXboRHxBoCyR49CB3xV2W8zqJ5HdS1yk+8=
X-Received: by 2002:a05:600c:1c97:b0:45d:e54b:fa0c with SMTP id
 5b1f17b1804b1-45de54bfc44mr65122055e9.17.1757362762024; Mon, 08 Sep 2025
 13:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com> <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
In-Reply-To: <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:11 +0200
X-Gm-Features: AS18NWCIvLKT4zY1Ax7hHZz8nFS_pHxT1rFM_aQWd_F5XVIT_8vgGZz-WQhHzM8
Message-ID: <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >> +       if (kasan_multi_shot_enabled())
> >> +               return true;
> >
> >It's odd this this is required on x86 but not on arm64, see my comment
> >on the patch that adds kasan_inline_handler().
> >
>
> I think this is needed if we want to keep the kasan_inline_recover below.
> Because without this patch, kasan_report() will report a mismatch, an the=
n die()
> will be called. So the multishot gets ignored.

But die() should be called only when recovery is disabled. And
recovery should always be enabled.

But maybe this is the problem with when kasan_inline_handler(), see my
comment on the the patch #13.
