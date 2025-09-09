Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB81DF97D
	for <llvm@lists.linux.dev>; Tue,  9 Sep 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429191; cv=none; b=jnSgz3hr2Q+on1PJpPBNnx4ytSC5zKzw5PzgLEKG5MJMN11gvft9cewa4NeBLkt4cwfGV+t9zEsvJYTNXIitIDlxEnPFV2A3B4DBmKerHbE60PZCe+yC0faouafia/KymGeiIQBKn914kLqNX9ebCWfPhpKTOV95u+wSaIp3w5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429191; c=relaxed/simple;
	bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up1s+aGd5ceujjobAYoQtNwnf2EPGxOIZAbqZ0JPtT2R1p9Xu6gRKlOaXmGWsvv6e1F6RfMbpvC6sw9sFulO+1zlAvVGZmu2M/J9+Jy/v8dlGuWGjj1uz1OjXwrVRyPp2QTraJ/H+FRN2WS6kvjP81u4/4eZnez9moqJaOgOuTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ac6NyXnd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ac6NyXnd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so38304115e9.0
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429188; x=1758033988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
        b=Ac6NyXndofiXEEcZn1EPMS95EBOLHEZMY+Hq+An/8m2BbgwJoPh4p4mnFBMmDoNXYU
         0hWly937bdoMHo/dCWqOshL3xc2v3niMV46sc6OVe7EIieXNmvM/eyVmwH8/q7wZpaVm
         P8LK0y94XfDs77LUA6I8Obpka80k3URAWsdtodtFlqpJMLHtdPw0U6Wi0RIntH0yapvj
         xleeAdyKxQHJYlkM2Tcap84GNWzDgkOKM0tXfvi8n0SMeBn1tOEFAm0LL1f1wiAu6q9/
         28btvGaLHCia3ODedFmvswAAfhe03g/ESGz+jFprs0WDuyurHykOmNLIlpjSfB1k1PWA
         q8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429188; x=1758033988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
        b=DOaNtrLiF5YD9EjuQsHDFC0t13NyQKwjvXhHAcNuQaChH5R2ZFsAqwh9vv+zxZQVSd
         t+Wc82qZo+zXZou8whBdlEG19BFaT7dTqQQS+r8GOvd5QPVD1RzzLeeKfR6lpaMZilbm
         9MYO1WPwPD4krZsZ9OKgGexX739VF894aNfD7r/voJtlytfNfIq6z8eWUirPB6pj9Nke
         YqCS2f9p65wjNmqphCK5W6uQPx84a5VM83citV81/v8FbQ2l5JZmazxJblcinMxfMEN7
         dJEjfhVYFQubs94ONs6/TKsjbz9JdFGGxxzevy2lZDu8JKHJJ4bu09C2fDWWuBFKAwul
         Ks9w==
X-Forwarded-Encrypted: i=1; AJvYcCXbod0uT5QJcCGrGNNnLnuAygxh0ATHLaAUs7CeVs+BnVetRDC/4UFH7e1SX2XSoGrQC69K@lists.linux.dev
X-Gm-Message-State: AOJu0YyIZX9h9wKr77N/hg51cDKuRbbZ0GWn268bu+OS5VaKHZ6s9HtO
	azO79Z4Eyuop1DMHTM7Wgv1AqbYO1MgQxbC8WwSwGXEu+hiGzaeWDEHqWUzrRfA5K10kYEzueE/
	MjhmauWHxdbHUaiS4EgW9IZGoufP13Ww=
X-Gm-Gg: ASbGncshQI3O/gyX+sF4vYK1M+rCL2L3qzX3IMTQOiRhUN0kUe+O/vKx6lRecKTo6/B
	mMJKdyr0y1zar4/Vt+vcYaYEhDcZSvinYDR1y6+m4VqHJIf0SRduxbVWtowwDeHV1zafHdADPVw
	lYKGbw18GaGu1ppwY6NlXpOINWd/XgtaV3MglvcFSIoLwKjUxrBwMfa/C2M86n7EUqZDmw+H2Lg
	3N63VPAEvSRRJhrXHc=
X-Google-Smtp-Source: AGHT+IHX8hpEThdKWhfgKRLr6W0FWhcfhr7A4C3lXlb+Th2laAYeLYdN8LPk5jePjYDY52XyG4mlIX7jog2+tQhQdNM=
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-45dde20e5c0mr116112155e9.13.1757429188072; Tue, 09 Sep 2025
 07:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb> <47ip2q7fc3q2igjjjg24bl3gwlpcr5y37pahkqb63ridzj262u@augjvsnpq4kz>
In-Reply-To: <47ip2q7fc3q2igjjjg24bl3gwlpcr5y37pahkqb63ridzj262u@augjvsnpq4kz>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:46:15 +0200
X-Gm-Features: AS18NWBnjU96S1X9HzwLOYnj48ud-1aT029AYj3EOfOXKk4tlcXWbWhwT0m09CU
Message-ID: <CA+fCnZcG4Eqy84zNuvZ2Tumi=eA=KAGFFeduRLiUUHYRBMuDqQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
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

On Tue, Sep 9, 2025 at 10:54=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> But as Peter Zijlstra noticed, x86 already uses the #UD instruction simil=
arly to
> BRK on arm64. So I think I'll use this one here, and then change INT3 to =
UD in
> the LLVM patch.

Sound good, thanks!
