Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC335DA4B
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745942; cv=none; b=WtHCCat+k9eyByWLcB3UI8YWhHbKnwL77FN6fIp0/hYJGTdTCYjluK5jLu9uNPHZCUEmddECF9ebfjTBv7DE5Z/i/1mr4BO4uSDb/Rd5rk8uy+GQOI1TO8VtsGNeXkZd0VOXgBawNAqb2eZUfH1JbfQpjk6C5Y2NrzIDWDPyAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745942; c=relaxed/simple;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hywabaRbFfGgMsl9BC6QzrtkGe3v9qne0pnWrGmmqcRytYomTWNKOMRbqNE0rH9NkFUKwKRW40EmuNQgM/rkRmUjhmBosB2ViQxLVeQjUCa2I9ckSXTJ5+QvKKU9z+TTviZOY1BdqgWt5mrBjAIgyBu0TGIc8+VAZKjNaHAZuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=fail smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=D/mneLLF; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="D/mneLLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772745931; x=1773005131;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D/mneLLFVs6r0IvF+iCRfj60Ah/EZZuLEfnUlva1LdL5DC82Vz9Qw/VqefhhANJWp
	 WDyIrKxz8tdw1gjxkMNCbBDQaV2m8g70kPhDvDgqzjq10LWdXthhW3sqaOhboAVimN
	 fx+5VJ1BndeTf8PTDE7XZ5c1QF09c544w9woMA5NGpZE1sAIC1ejlnCTGEAy+GkzoO
	 Np3S48Ku9tVqsimRsmAltXy1/WyBD31pdq4wHYtO5HTpRIAD/yUzeNKjaEYjiGM7A1
	 xRIXcWjq7VefAOsjRln3WzSuL5V/BJC8LgLU2T1zJl/RE4F5LnsI4Q9CZOfSXLfeSb
	 guSupu87mt2BA==
Date: Thu, 05 Mar 2026 21:25:26 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aan0qbP0iV48bih-@wieczorr-mobl1.localdomain>
In-Reply-To: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me> <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain> <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 2a85cbea50d69490acd671149ee415089f8f199e
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-03-06 at 06:22:32 +0900, Andrey Ryabinin wrote:
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:
>
>> Thanks, that looks really neat! I should've thought of that instead of m=
aking
>> separate arch versions :)
>>
>> Do you want me to attach the code you posted here to this patchset or do=
 you
>> intend to post it yourself?
>
>I think you can just squash my diff into the subject patch.

Cool, thanks, will do!

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

