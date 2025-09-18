Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC4A55;
	Thu, 18 Sep 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193840; cv=none; b=MAXoGZ/642z1Ise1zhRNOyB+92mCALkeRbkHSKcGp0+vilUZ3GpT0Ay/FlJfySC6MaKRe6Ucp76CTwsEqtZUokfkqLMDpGWfY+KalsBYcawskBKpf6+9khImesYfdWaO6fuL7V0eFH4GucRWR8e93cwRc4IoyvRro9QIgJD589Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193840; c=relaxed/simple;
	bh=2KrYFDj3flSfc301+NR7geZ76KYqCPXguDOVy93blJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTq0sSa4ciak78vF5gfLOocrXwTtPX7mVBQlkD3tWK5dHrNr17N8eT3i0+I8ufPGwharcjMwjD4WY726k18xlVVNaD9NrWVnLGjWljoP0KYDvLfDdbUajk2G+S0LnpU4XEJJMiusn2zCSnvT4HBvwaHpaIils1hmk1kNtieX2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O4Tw2pwu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O4Tw2pwu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2KrYFDj3flSfc301+NR7geZ76KYqCPXguDOVy93blJo=; b=O4Tw2pwuynr1m8Ft2gdJc/f2iE
	3j8g3zwvsVx+mwAhMBvc2V5i3lALdQry90pcZrnoenLzMuVsxgJctdYlUvWpbRDC5jtsdsZzQwHCw
	HYFIdyHZ+gHLt/DVeneP7lnTroVi0smg1xK7fGK9hI3nFOvYvg3AA6fshSGRrUN4iUjENdY1w5sDM
	XzBnRt0JntyuYKtim7/kYM3mPWUoVITVjA7wVk/76Cg62SBQztCjmVMIms0mKd0ySDxnuVwdhcA9t
	bpQLnponxUKeWLgwfLp3biQTkT4mMGAVKgAuh8vbg+6g+MM/XJ+wOCeLivkDg6fjtV+81zUaeR7VU
	xfv0xUNg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCX3-00000007auo-1UFQ;
	Thu, 18 Sep 2025 11:10:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5ED16300125; Thu, 18 Sep 2025 13:10:32 +0200 (CEST)
Date: Thu, 18 Sep 2025 13:10:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: linux-toolchains@vger.kernel.org, llvm@lists.linux.dev,
	aaron.puchert@sap.com, Aaron Ballman <aaron@aaronballman.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250918111032.GY3419281@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <CANpmjNPRgUz9oX0H8kza2sB847Bai4rLtqfOnUSLmqt2Zm_pqA@mail.gmail.com>
 <CANpmjNMCY94VxH1Qo802pPjZ6X5i22sL9CO0ChFLS=q3Rx4CAA@mail.gmail.com>
 <CANpmjNPVBApJDUEX8kEkdBHRKODTTTotEsoif7tJemDRfPtW1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPVBApJDUEX8kEkdBHRKODTTTotEsoif7tJemDRfPtW1g@mail.gmail.com>

On Thu, Sep 18, 2025 at 12:37:15PM +0200, Marco Elver wrote:

> Patch bomb away?

Yeah, lets try again. Worst case we find something else that needs
fixing :-)
