Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13571F151C
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844434; cv=none; b=VEfVBZjzBPh8ZoJRIgiWyaamE7iToyQI7cgh8mQxZG+XurAaHeG8nveFmHcweWdfjwYNg9aCXWIfP5ZgMEAN39OygT+kRlwl5WDK8W46MAABGZgCPnsIAkq4K8qjm6u3/rXut9ha79r8FCeXJBBDzRc6ntiTZUdclBDQdkjX3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844434; c=relaxed/simple;
	bh=P2PKsk7fNzG2H46h9chWVfwFOLLLAa7loCQ0KXUVcmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlcIuCai3c2ayFcUIdzYWf1x/BqNw12EJ/mt7Mu4IBOqKCdH1Oy7HG4qBb45rUjVuyKjitICHXKoywYem9sIJ1vfZREBhFGwlvGGgSF3m7nIyK6j08QbSmjya85oY5jo0Ah9ceAivrhVhYGktbSvd/jVatYYS3F2WTKtCuJGGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgPQGyej; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgPQGyej"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2150888b3a.0
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 00:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776844433; x=1777449233; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CjbD5DAtK575buPNI+qG/w2afm0sso4VcbZ59zXJsdU=;
        b=BgPQGyejIbxF+UTBrCV1o7l5Gg9MgkViww7+QSHjMaN2m1pFj65bctqHcZJ4jJUMYh
         CVYMtGvIgWQvL6xdUR1+UfpJdTv4jshlzthz06L8+j+HDtvftFg/aZiH6MXyYo9Q7373
         Ob6PTAk3gfns1pMPDsrxnWseupi9cz+hqAGuROq/55vHNMS4r6gel0Jr1SgtWufKO9nS
         jct/FwuoKzpwVqSf4cLkHx6rLj3+UzeWOEkXeW3tXB7gXRQUK+mD2G0teKHMeF/rZWUC
         KQG/UwGjq5mURW0P4tawpv7U4Ts04xHqYJYu4UHRbVeb/NW8YLpC1/vJZyjPNS5eA8H4
         Hhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844433; x=1777449233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjbD5DAtK575buPNI+qG/w2afm0sso4VcbZ59zXJsdU=;
        b=U6OOTyr0FJ7ByXIbasu34F7YH/8+KR+EO3UXruy6ZICspAAf4X5zSsSFnyyfdOJyrH
         fWxCqDKDlilHpwB0CfZDk3jfQjVuXKVaYZRbkvONjX1PK0pbFFn7lEZHNBLdzuldR2jU
         O5DiCOw0GrrbKcFms7Kn40NNc2w2Jfg90D1RYHq825J0EAxktMId8vUl1J5zScgw+Vw/
         QFoAN/Fz9tFTza6Xq2qIA75I1TZIvXv96bN4Lz14MDg/jBZze1PMMWQ4K7mUssa6pABP
         lR4etL4lNh8UrIqQImpqytaX/z3jFNPa7CjPhddc0keSwpMpKK8kGmD8EVU03REKmXPp
         9raw==
X-Forwarded-Encrypted: i=1; AFNElJ/c48TNYa/7evxP2oNqFCkc9vGqth5FUer9ehae/u9N/SOfdhmTFZuDnh+WwbU3lBw5v5CC@lists.linux.dev
X-Gm-Message-State: AOJu0YxIvs65uMIEQOeDmBtSG7CwZZlekWPSoIbPvKphGOjFFVJK+i8e
	NzX9mIb5k31DwLeRD6WmNvN4d7ZnuJmNcTQChdXsCReFW5UThmy1KEhV
X-Gm-Gg: AeBDieuUV1KUo59qNjdhoWezKgPs+BQKo52DK+723QVk9eLi1NoWgm6TZvJwoe2qlt3
	/B+0wUrQfTgvztk3lLIlaqA0dsqAAZG5VzfWQdTpXBRaY6BPdzgmEJlobM+ySekauZRdcPNnGeG
	VSSjrDKm6VO0Zk6zecaaSlKZpNxOlSxknWE9IAtJRv58vRC7VFZuL5InmLB4P92oqBYjdSfFpIT
	iH0XGKqsMAYZevLlGqz5rW4SGQ6mEVrwVqXJkclqDUk7fUQJmDHAy+s9o2jP+i/Ge7ZLMMXPcA3
	HgqA6HBeTHWIKFgxk9mzRMC+tmVFqWcILtQAxtnjmhfmMPuHg4DgUxAEq3IkopzW+LBavXzYprj
	luu8TSg1W/nlDyyTMeLmUi1EJVEqo8PfANMM8NYLJ71iH7D1zrRdtxhIs4zZ9/CJnNqyRFrehlg
	AhMlKI/ss8bd62Lkpn3vF6oO5gPBYHeu1C/a1WeAeYs+rxhIx3waLUdE9EACBJ6+8nBKbHcynLq
	fOvJQ==
X-Received: by 2002:a05:6a00:3315:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-82f8c99bb55mr21216994b3a.38.1776844433042;
        Wed, 22 Apr 2026 00:53:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm17662514b3a.14.2026.04.22.00.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:53:52 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:23:41 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeh-QhEGO7ZiwQZ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>
 <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>

On Tue, Apr 21, 2026 at 08:16:06PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 21, 2026 at 7:47 PM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > There are some other build errors apart from this on 1.85. So few months
> > back in the meeting with LLVM team we concluded that for sometime
> > powerpc will be ahead of other archs at 1.95 till others catch up.
> 
> In that case you may want to modify `scripts/min-tool-version.sh` in
> this series too.
> 
> I hope that helps!
> 
Yeah this helps, Thanks :) 

Will post out a new series soon.

Regards,
Mukesh
> Cheers,
> Miguel
