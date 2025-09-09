Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA869191F72
	for <llvm@lists.linux.dev>; Tue,  9 Sep 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429159; cv=none; b=u0jJFeMVrz69U+5MyLpQZYO8dPsHLwephslOhD6jArCzagd6b57/3j/saq2cqp1O6KIwJZb0vCP5XYGuGuvihcmr61wPfo4Jgawf4700F5+wQjmGOSdQUrtN7wlT+BkCt49R0ugia+CcXHYe95id5thzR2RnhA0eT6wYLXUT3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429159; c=relaxed/simple;
	bh=h9g92wWrXJhuOCmJ8Py7lEU0MPRoS9lrUiVWjii3lxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gd019p1wkvxl1Er8SAMlJhklkQn3gbU06rI4/7WNy/54Iizuiwd5aqRrKfYi+rzsT13SUmN3c7ybbWwAhXRDNrMFyrYe17VeXqrIs4dBELbyBhX/ykZtuE4C4JPhcEe7o6X/X3syn3W4wSX/lO0dMxybBUMQsRG6zQktP2lRhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsiJhauj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsiJhauj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dde353b47so15109735e9.3
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429156; x=1758033956; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T/yu3N8TV6o0nCvXPls2b7J7vwcGfC7bXk5KdT0X2s=;
        b=IsiJhaujMcdxmehi4OctvXnlvdfBaLdOejjHH020y/Rv29gFxtVGEyQmP928aZyx5P
         hgJ1FxV8XKTPdJA3fBzPl8qIXZFOj5GuBZfkh1x4P77NNFfczj5wnPITS+VECEN1diFm
         +rPHbQcnzQCQbL8VlSAu75Du/reOLxCdmzC2TvaNJGduQ6sWffxsuqLVaQrHF0Nqmq3z
         FYwWge0uPjGn+FjduQiu/XGS3NcF+oCvnQKefaPqchrQ6lHUBacPPC4fu1p0/VL0cOHB
         kqOyonHD5anOX4sXdgbVfjiAzeaFfbxqYlyapckonccPAwoX35rQdL5PgQbEraBihb2h
         L+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429156; x=1758033956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T/yu3N8TV6o0nCvXPls2b7J7vwcGfC7bXk5KdT0X2s=;
        b=fgynZbI+T+9K8lhN/BfhI3WKQiAEy+BBT75lttEGAxF3SpQTaHr84qX9MNUEXzO1Zj
         8F6UT1JNKAe3vMw++RyOW1MVPbMAIOZxvtD+GRO6tQBj2VVOSvpcz0rnrkPZXFTe5oJ1
         J2jRd7Fr1tq6LUzcbxKO8VCMCU7ZivEUaUzWs3+BBW2WxZy6K9Tv8xZsgVjxnAQ3ZGp6
         WISJnFJFQt4esYeIEJ/LFdkDk0iJ5lTrTfTbjEOyCOxAQoLqzrrYTIu1889ZreQr6OUD
         kAfvCAJ6+51d5QAEiacnHNP1r9dK0/pmXhcN+piGwAkYdBswGoZj1AMWC031F6D6fy/p
         gQLg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TVMKKH6P276wTCEuRwNh/aKDNC3fkApSV65nnX/+uNMmMt+VJ/XGYdMd1ihHI74a10Ub@lists.linux.dev
X-Gm-Message-State: AOJu0YxOyumERcyi9pEhBPaWwnrKrreW3EsHyjwGmxInMPSM0YMgFXkT
	8b3U6ErR6/7ZC0Ig70n5ZPbQxx4o8wRBVXSFtEblLyPiQeS4qACWCZzHsipPMRmNstQisPbL3MN
	vtyG2QmTrsg276MQUPUZnF41x00N3NF4=
X-Gm-Gg: ASbGncvSK98ygVW9BdGsOXu5LU9i1Dzck9NRUMn+4MsWTPRuBI5izVpKobGEwsClAgY
	OLt9eNWgFYnHHdJfPoAXJ2tFm1KtbpnnNmHoXMIIW1RVe0dkb0UfKrwzMiLVTraRgtHzQzH/7EE
	X+FZ4w1feTwSq7YxJWTmELcmpXAeCjg3ucHRTqSRIt+sd9dmiVRUUQQ8pOB0t/qkL0DuOYLUQo+
	5amwqpn
X-Google-Smtp-Source: AGHT+IH8mznDXMiTQJweNCJMFeyunuSNo6fJv5XkfHlGkiJSKVNMuvO31tCVhwde5ClSRv4GzI1pVbP/cjzPjFzqa4s=
X-Received: by 2002:a05:6000:2c0d:b0:3e7:441e:c9e1 with SMTP id
 ffacd0b85a97d-3e7441ecde8mr6759404f8f.18.1757429155814; Tue, 09 Sep 2025
 07:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
 <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
 <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com> <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur>
In-Reply-To: <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:45:43 +0200
X-Gm-Features: AS18NWCko3Nu4vYg1YjsVoZlO3pFTQTWFNFMYZcWhGCR7k_x37D691H981KEWl4
Message-ID: <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 10:42=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-09-08 at 22:19:11 +0200, Andrey Konovalov wrote:
> >On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
> ><maciej.wieczor-retman@intel.com> wrote:
> >>
> >> >> +       if (kasan_multi_shot_enabled())
> >> >> +               return true;
> >> >
> >> >It's odd this this is required on x86 but not on arm64, see my commen=
t
> >> >on the patch that adds kasan_inline_handler().
> >> >
> >>
> >> I think this is needed if we want to keep the kasan_inline_recover bel=
ow.
> >> Because without this patch, kasan_report() will report a mismatch, an =
then die()
> >> will be called. So the multishot gets ignored.
> >
> >But die() should be called only when recovery is disabled. And
> >recovery should always be enabled.
>
> Hmm I thought when I was testing inline mode last time, that recovery was=
 always
> disabled. I'll recheck later.
>
> But just looking at llvm code, hwasan-recover has init(false). And the ke=
rnel
> doesn't do anything to this value in Makefile.kasan. Perhaps it just need=
s to be
> corrected in the Makefile.kasan?

Recovery should be disabled as the default when
-fsanitize=3Dkernel-hwaddress is used (unless something was
broken/changed); see this patch:

https://github.com/llvm/llvm-project/commit/1ba9d9c6ca1ffeef7e833261ebca463=
a92adf82f
