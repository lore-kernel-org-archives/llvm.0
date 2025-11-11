Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EB2ED15D
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853721; cv=none; b=ZSNEcIgm+bX9xG2btH6JUdWSfKYx1NzKZl284Qz0dcEPWUBak0QDKubk8RqzVDTI61ZrROkPxuf7B9H1Rc+RAymVorjH+9BSESXOO9IVCLsx98A/Yq8+VW6jRmDY8Vfn6bfQZlV3sYczZAH+l0kU6kcTRttv1+PE+AHcXqaY+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853721; c=relaxed/simple;
	bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbRAwT3seDBMYM5XO/N5bk40KZwsUgOTriMednuwpsaotvDpT3tW6ymATVWWKAHwGBy1nGwmka9wkXYFNzydM9PSX/CfD4or3zhH1s7AoPLSwM06PPCmdlzV8oLFUNKb+iqrcynA5gocaNrBScUY4OJSrnYOqE9AKvmIQa3YlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EWqa/Huw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EWqa/Huw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3133423b3a.2
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853719; x=1763458519; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=EWqa/HuwOXbJQkV1/ktbSMuSmPJi/uG47PMJT7L0MPV5Wv8pmRG9fRtxijFYNccMhk
         WVoUqPjg060rIkXSmckm7YWOGiXc0NzbsjmqbGHy6KJwcZlGee4aswcFS0dCg+te8l69
         oAARzA2jw69HP4JZYEiGghIwWVyScjNzclIoXCUqrpDumB4h2Ri1ztM0ZdjGw0urhZMm
         54/bFGraTLh20VuKJK7L5URnvB8/Advj+m5DUuCu2GNt+nN0F3Zncdsj7/W8k6wixb4N
         8nuPpihvzqyuQwLgfSspCMLnaTQIkJOIvZ56Q/wiX8yLv9hnbS99/0acpj1Bb/MZX9+N
         yPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853719; x=1763458519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=G5cT5elgymWf5GUqs/7AqZNhbd9kFkcRxcTIvCLBWsHYqoSDCJD3tzk4wEKKzoBpaM
         MT3bUqe9m+j5dWXf9zijVb5H+gLbjFNpBwxDPYxuNOm+FvHbnH47YusxiP0IKcjO49rm
         tfiJxvLu/cLIGqMZMpMVOK/MXlh/Frt2mDZ+T7NnCmoyzNUClf//a/nsyrag6Zxs6mLn
         5ACL4IiRRsY2/TGlplC03GuQu6IrWQWJIl4B80PlieJz9ogJLCMD3gtqDxtT7zISGHWH
         fnShkIGWSNwwVn9/DGJj0vXsBg0AyJdSwJIllqzS7bufpo7rKA7pJpls3BSP9vkXcUF0
         XfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUdYX1eJXnuCLg6mUwc+R6etaGtCaxRnfIaJcBT829+TOYq0o124ZRsNAWzSIidwARgMbr@lists.linux.dev
X-Gm-Message-State: AOJu0YxR8zy/+hUEVJZreC+Ir7PpLWY5ky4J/R1nxM6mz6C9oq8uDqKb
	YkJaYkScGwqJo5TSyKFBraH0ZRjI5ULlhVhXKIpTeVNa5/kuZpAnYuDeJjcRBrJYh6tlRf7BjqQ
	+ISIkmoMp5r04gHi8MgSgJ7Ab+y98HPKT8eWRCdms
X-Gm-Gg: ASbGncungDKL+v+q+jAK5sBevr+3+Z2waxt5I5NpJaaHZrrh97CNUjSlz4BOYWm9xb9
	omZTjeVk6yEhbZULa9EJGI+OZi9XJsnhuldVLdVaR2jNzmum9UeXa/4IUZW7BOO0KZCf8ziV7Lc
	VXs5FaGaOgIGWTIZ/d6j+eI6Zci5pksbQ+qu+8ugGgqu8SF6FzJ6U9Zi336MNvGRQdg4mQSbxOU
	yoGNnu5A/tIZqFNGY7A3cr4eG+bEIbZC6LkwzK1zgEiKC+M7cSZgJpTzRuAYRxfV5NpD3+YNwB1
	YnrmZduwylsCHOc7Vrw16YNOtA==
X-Google-Smtp-Source: AGHT+IE1gIu9BAiXsX0H1O+GFnCkjCXA7LjUzdEGNtie4OCQJL0hEG9RvsKQFDwhfkMp+tiOpjzqm/vRLg5+ZmsNZZg=
X-Received: by 2002:a17:90b:390f:b0:340:c151:2d66 with SMTP id
 98e67ed59e1d1-3436cd0bb4cmr14245240a91.30.1762853718758; Tue, 11 Nov 2025
 01:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:34:41 +0100
X-Gm-Features: AWmQ_bkZUqiS435kDnMhK6mmvyG8PwqBjo8fr1ltJrKRlyqzMnD3vTHwKYRZs0Y
Message-ID: <CAG_fn=UoQeoHh6Bpy0YOCywpfaimuYZM_d043JfxLVReW8PdJQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] kasan: arm64: x86: Make special tags arch specific
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>

Perhaps moving this part to patch 04, along with the newly added
kasan-tags.h, would be cleaner.
