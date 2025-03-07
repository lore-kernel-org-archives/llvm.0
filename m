Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B8136352
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309854; cv=none; b=vFkgvClcnaFLMuxpuWYTacwJI8sVCXd9aSJ8cHKrxyn9U44xrfZiLxfGFfl9IM6L2wF/53heiWXgcmH3ORACSMcFX9LiAZ1qkYzUNKxHe0tBmYGN4JxeT25hUf21/RugxL4HVKZvlGuKDi7wPh4XcgPHICIRRl45H410+ocZ5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309854; c=relaxed/simple;
	bh=U8W4lBndXbHt9de0ee6upN787KMW52umATu2vsi2G1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtK7jReBIWcmmgi6AU5d6aiYNancLqIK5Cojm9MuRGxTaTiqLr40uhoRsfAYeUB11hzZbwDoU4hnexpNnfKkUua6ys3nF/F5PugCdQUDeYr31SPlBa7wwT6G3BtBNd2Dop/v0wC8slkeyJEMcf8jpww5ALr4AVVxOW+px0QXJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBFqEUzp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBFqEUzp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso7510545e9.3
        for <llvm@lists.linux.dev>; Thu, 06 Mar 2025 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741309850; x=1741914650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8W4lBndXbHt9de0ee6upN787KMW52umATu2vsi2G1s=;
        b=EBFqEUzpfKcAh1QzBzaOX9gHN3ajGeUQhfm/vO6yFhvReRZtwacRtC9w3wrPz9mElX
         g9+5yyAn9PrfNO/j4VK21lzorM3bc/qbj4ercd6W1WKFHpz+0y1KDE+DXsTPBZVqaUbd
         EOm3bG1qrYZ63zwwk+jlnlCtJTtZIPI/M8WXKjr7mvSFPTziJ+yD09GJ/3uu4ekRjfVM
         YVLRtSy1ahB5di+/28zCtiRNoFLor+F1fds8YpsqfHmCs3VaukB3GWnPL1hxnhXtdyfC
         ig/A57IteFgYH+UySaRttpN5EWE3YmTAI+p5xIGRKao3k3fodbLYJMOPV9pOCnwhiwXl
         7wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309850; x=1741914650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8W4lBndXbHt9de0ee6upN787KMW52umATu2vsi2G1s=;
        b=mN1CdrxsqMo2QCUYE3ZbWr5sNoBBhQadsVBsCDnwZky6RZCZvYfpBpjQfNVUsjmqpW
         yZcC+sZ1OvuoN/qZ27asNVf4S/EuGXve7YN6PS2Av6d/xcvefVQfNQzM5MzD5HfO10IM
         iypGgkZQ9+Yb48/pegMb1WzU1xFzXwqf5sCShevTLw672C6iOd5yq/hzkEg8xQV2d5Bo
         i3Avq59gbPohSVf3a4UCEIQFfwfGN5Ne0GWSQu3AZHQ2rF0svQRlYuwoYCW5Bp1VbPaD
         46BnT0bVueGbI4NNk1UQ/1ursPmUBH0g9AanqFpraRpWgUnUlttI88yL0E3vCRouwaAO
         27bA==
X-Forwarded-Encrypted: i=1; AJvYcCX4tAKrqdxYOf9rDCIPLVm/UyyNQ9sXTFKUiz6wbUudBGmDRdzGEW3DjHaBWkDOgcCtExv7@lists.linux.dev
X-Gm-Message-State: AOJu0YyF3shbFpvS314sDiFISiAqId18UygGDGZqegKk+eWskWSRHEjy
	nabbLyX/enCh/agKz2nKdH8hyYXKf+m5NYvTdLvJnYw8NyTYHhnHlyBqzPPPVHuK2I+Qfh3i/Am
	HiELRkvR9y+pHl/K/enIomEINXZQ=
X-Gm-Gg: ASbGnctoYrYIhCGqQlCJ+Iyld9w5SZW7kN1K0S5RPwY1JxM1Rd7offQU2JPqJO7Ka1P
	4eWaYyMhqBmRIUmZSCpFceL5pglUahCA1YM1myaY/zQo9LUSH/AfsNAKbMPAIbqXboZQc+1SSOw
	18TPvfOxRscJJVullFGKtkEAZxYMmE
X-Google-Smtp-Source: AGHT+IHcxwy2elEu5fwV9PGx1saik9Pw4IRZRUb5LxTYzJmaYAjPccFT/W64mJXJreBTFyx+w0ryjVybFCrO+CIEJ/Y=
X-Received: by 2002:a05:600c:6d8e:b0:43b:cc3c:60ca with SMTP id
 5b1f17b1804b1-43c5a631736mr8352965e9.21.1741309850252; Thu, 06 Mar 2025
 17:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+fCnZd6O0_fc1U-D_i2shcF4Td-6389F3Q=fDkdYYXQupX1NA@mail.gmail.com>
 <uup72ceniis544hgfaojy5omctzf7gs4qlydyv2szkr5hqia32@t6fgaxcaw2oi>
 <gisttijkccu6pynsdhvv3lpyxx7bxpvqbni43ybsa5axujr7qj@7feqy5fy2kgt>
 <6wdzi5lszeaycdfjjowrbsnniks35zhatavknktskslwop5fne@uv5wzotu4ri4>
 <CA+fCnZeEm+-RzqEXp1FqYJ5Gsm+mUZh5k3nq=92ZuTiqwsaWvA@mail.gmail.com>
 <qnxlqbc4cs7izjilisbjlrup4zyntjyucvfa4s6eegn72wfbkd@czthvwkdvo3v>
 <CA+fCnZdUFO0+G9HHy4oaQfEx8sm3D_ZfxdkH3y2ZojjYqTN74Q@mail.gmail.com>
 <agqtypvkcpju3gdsq7pnpabikm4mnnpy4kp5efqs2pvsz6ubsl@togxtecvtb74>
 <mjyjkyiyhbbxyksiycywgh72laozztzwxxwi3gi252uk4b6f7j@3zwpv7l7aisk>
 <CA+fCnZcDyS8FJwE6x66THExYU_t_n9cTA=9Qy3wL-RSssEb55g@mail.gmail.com> <xzxlu4k76wllfreg3oztflyubnmaiktbnvdmszelxxcb4vlhiv@xgo2545uyggy>
In-Reply-To: <xzxlu4k76wllfreg3oztflyubnmaiktbnvdmszelxxcb4vlhiv@xgo2545uyggy>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 7 Mar 2025 02:10:39 +0100
X-Gm-Features: AQ5f1JovwqbYdeSGr0-fcudbS7_ChDFAODKKUUmrprBtHFAHDoFjM50Rrc6n6VI
Message-ID: <CA+fCnZdE+rVcoR-sMLdk8e-1Jo_tybOc7PtSp9K6HrP5BEv95g@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Vitaly Buka <vitalybuka@google.com>, kees@kernel.org, 
	julian.stecklina@cyberus-technology.de, kevinloughlin@google.com, 
	peterz@infradead.org, tglx@linutronix.de, justinstitt@google.com, 
	catalin.marinas@arm.com, wangkefeng.wang@huawei.com, bhe@redhat.com, 
	ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, will@kernel.org, 
	ardb@kernel.org, jason.andryuk@amd.com, dave.hansen@linux.intel.com, 
	pasha.tatashin@soleen.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 3:08=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> But looking at the patch you sent I'm wondering - are we treating the ari=
thmetic
> in kasan_mem_to_shadow() as unsigned?

The shift is signed (arithmetic). But for the addition, it doesn't
matter? Adding an integer to a void* pointer should result in the same
value, regardless of whether the integer is signed or unsigned.

> You wrote that all the ranges will
> overflow but I thought we're interpreting the arithmetic as signed - so o=
nly
> positive addresses will overflow and negative addresses (with bit 63 set)=
 will
> only be more negative thus not causing an overflow.

Ah, yes, I see what you mean. From the C point of view, calculating
the shadow address for a pointer with bit 63 set can be interpreted as
subtracting from KASAN_SHADOW_OFFSET, and there's no overflow. But on
the assembly level, the compiler should generate the add instruction,
and the addition will overflow in both cases.

The important thing is that both possible shadow memory ranges are
contiguous (either both start and end overflow or none of them).

So this was my brain converting things to assembly. Feel free to
reword/clarify the comments.

> That was my assumption when
> writing the previous checks - we need to check below the overflown range,=
 above
> the negative (not overflown) range, and between the two.

It could be that your checks are equivalent to mine. What I did was to
check that the address lies outside of both contiguous regions, which
makes the checks symmetrical and IMO easier to follow.
