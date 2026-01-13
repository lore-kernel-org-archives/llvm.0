Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CE18A6A8
	for <llvm@lists.linux.dev>; Tue, 13 Jan 2026 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268847; cv=none; b=tq97O1NG2jNq1cMCn/CNpt4dSkxKXU/AKWK1nvOX2oSYD9tKVPJslXkZWPJr4x9MsCq7NVFLe9x/tmGMAuEU9C9cZThnUd61/5Swl+wnzafIpMkLXDyaRt2QGhgtmhnPdutquM1joamewbRjmr4X9W64cW0xgwOm1yAi0L56TjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268847; c=relaxed/simple;
	bh=EThfGl84CTszs/M0mz38/Onq65rS/FlgjvnqzHnCYTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=px3GvAA24G56eSwU8XjQV5IpFqKagzsimX63P9oVoekS7FiLYfrkwu+qJenbl4YZV7UA+PH6B1fCUuxXU1TkIi0bOJ6IN56DrWFr80RGzHbHHuakvqIPug0w43jcpi+FTTlyHq97DaTTvMR5v9PgCWcTvID1ldI6C6EgWirEXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeH/JURj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeH/JURj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc305914so4987864f8f.0
        for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 17:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768268845; x=1768873645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5Zya1QiiH1g15sa03C60PMdmscKG1ONGxgStc03n5E=;
        b=JeH/JURjkOHIxfsY4g6nVzRzzNZgxJ8k2MQ8lgdQ739yNaMt6bORf59YArBtUHQCjy
         8gb4HOqOOOuCxyHvsJCMdYU2Ol8tl9GgSDWJC+IKnvLGiEiPSH5AFxX9OOktlvgnEj+e
         HTM8JT9vc5zEDzh9qPyt7RiK22rk8lEvsFKGycW6/4qtv+g1BqZy807ZL1ptQBK6m+nL
         VHRsk/MFI/MwidqiWWl/PdBuL5OAmwW3rBOLL4kNIW8GgfgXl+Hl3hEBHr3Gol+RsGKR
         LKuPRpey+ZN0s9itmUoRVo81kHEcKXx4UqHdNprhpOlrZVR5NBZH6O2TfTQig4yJjq60
         dqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268845; x=1768873645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5Zya1QiiH1g15sa03C60PMdmscKG1ONGxgStc03n5E=;
        b=SEqedern4hGKZJUZTYGotrJV0KIAOGZK9TJWXMYVrSCRfhCbUJfgCn9FDf3D9te3QV
         ep8vY40AgyQD8DkcVbbvM8trlj9ORfmg2k/jLwiqbbVu9Rnt72+yt+bJto7zGl8RcCzz
         b01H+75RHLA8ulXvag2N7npIeZAKRLg4QcKPWf4padbvW3jKwqA+KbXNLTvCyQ4N4MK8
         0TBNYICKl5vkG/Kz/E5zF92ZGWrj8SpsQp2n5yYkN4hMTAYxslko3GKv3BFOpF+CDlfv
         iM4MVo+kpqAU0G9WDetXcTMCZUuqVfdtDTiw8hIvPdprXFmgqyd0bPg6TqHcc5ot8nd8
         jJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLEfRJYxgR0PrhOUS/tbaXSZKMgCjiqM1on45mugbt7wSaDwvcvaZfD/14WtztzfmcLYvK@lists.linux.dev
X-Gm-Message-State: AOJu0YygC+7drISQg4TTbDAUGKtxah5lpx6HoihVIrKjEqjcXUPBsVhE
	8Gg1MuUiUIk7wXL2d8CSw3SFdQULxCLR7yDNv3/O4Aj5GVH3G6TEl4QjmNy1UmM7c7uDRwVpObW
	eb6DQOMCt6L15Jue1XMeJ46A8T56O8l8=
X-Gm-Gg: AY/fxX5bzL4KaeFGaqJjb4G24pxRWpDuyNsovmPmEolTJ0o/Osl+91p/2yYB084w000
	aJrUbmE5C8d7gUfUvAZ+PnKyv4zBcFzF3f7XS4JH6drH433jIbVfvyku2WfOUEbFVBD42qQ/eel
	BBDo+CLkAs4aezLWzpJJL34SmvGNjXeSFaz87O9wK1ZWzwEIiGlQDg8Ne1GNOpNxCyQuZYWJisS
	+ObN278nfxEU6qmbSnU98kVIaENBzVB+8+OQ6UPESmaBSidGHy8LGyE3Q0BaX2YXALQqaFn+y6V
	KthKKjxenMR5BqGreYxl+93ddxD5ZA==
X-Google-Smtp-Source: AGHT+IGLZPsHQZdYP+igQHFiHZwML+c/tx73CNXLiZEv1na3EZeREwCRzVBn7g5quI4ihevQAYTcxL8ulaKSY+q8K1Y=
X-Received: by 2002:a05:6000:1a89:b0:431:342:ad4e with SMTP id
 ffacd0b85a97d-432c37a9b5emr27240018f8f.62.1768268844511; Mon, 12 Jan 2026
 17:47:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768233085.git.m.wieczorretman@pm.me> <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
 <aWU-oL8oYS_PTwzc@maciej> <20260112125348.124d201ef2baf762561a43af@linux-foundation.org>
In-Reply-To: <20260112125348.124d201ef2baf762561a43af@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 13 Jan 2026 02:47:13 +0100
X-Gm-Features: AZwV_QjCQ1fbtNH6MxAuTA9Y-OoKsLsk_NAIZlsBpLK13R0P_Z1v4NHXaV8E6rI
Message-ID: <CA+fCnZci8YK04PPMT7gkMrrNHbMB3Ks+D4xG-5XkEOaywyrGhw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Maciej_Wiecz=C3=B3r=2DRetman?= <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org, 
	lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, 
	vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, 
	catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, 
	jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, 
	osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, 
	Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com, 
	thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com, 
	axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com, 
	bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com, 
	urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com, 
	weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, nathan@kernel.org, 
	trintaeoitogc@gmail.com, samitolvanen@google.com, tglx@kernel.org, 
	thuth@redhat.com, surenb@google.com, anshuman.khandual@arm.com, 
	smostafa@google.com, yuanchu@google.com, ada.coupriediaz@arm.com, 
	dave.hansen@linux.intel.com, kas@kernel.org, nick.desaulniers+lkml@gmail.com, 
	david@kernel.org, bp@alien8.de, ardb@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 9:53=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 12 Jan 2026 20:08:23 +0000 Maciej Wiecz=C3=B3r-Retman <m.wieczorr=
etman@pm.me> wrote:
>
> > >OK, known issues and they are understandable.  With this patchset is
> > >there any way in which our testers can encounter these things?  If so
> > >can we make changes to protect them from hitting known issues?
> >
> > The gcc documentation states that the -fsanitize=3Dkernel-hwaddress is
> > similar to -fsanitize=3Dhwaddress, which only works on AArch64. So that
> > hints that it shouldn't work.
> >
> > But while with KASAN sw_tags enabled the kernel compiles fine with gcc,
> > at least in my patched qemu it doesn't run. I remember Ada Couprie Diaz
> > mention that passing -march=3Darrowlake might help since the tag suppor=
t
> > seems to be based on arch.

FYI, there are some known GCC issues with arm64 SW_TAGS mode as well:
https://bugzilla.kernel.org/show_bug.cgi?id=3D218043#c3.

> >
> > I'll check if there's a non-hacky way to have gcc work too, but perhaps
> > to minimize hitting known issue, for now HAVE_ARCH_KASAN_SW_TAGS should
> > be locked behind both ADDRESS_MASKING and CC_IS_CLANG in the Kconfig?
>
> Yes please - my main concern is that we avoid causing any disruption to
> testers/buildbots/fuzzers/etc.

I left some comments, but from my/KASAN point of view, the series is
ready for linux-next (but this could wait for a week and maybe the
next version of the series).

I wouldn't think there would be disruption issues: one would need to
deliberately enable the SW_TAGS mode for x86 (as GENERIC is the
default mode when just enabling KASAN). But I don't mind locking down
x86 SW_TAGS to be Clang-only for now if GCC is known not to work at
all.
