Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809411CB9E2
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729011332; cv=none; b=nghghjL7o0P+GHn4zQAjxJG2ULKkngmMDcXWS2RmWX3b8Q0peEaymLSG2DSz1Hjpn3DGGsK/49MUIGRY9q2bdCB1S4bkKyVlw9F+LRbT8UZPgnxVKZjrMsWPOQiE5QYaqubqMQ7CvyWCh3iPd3hxZ9wZa9IyLWd85LLYqY4eVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729011332; c=relaxed/simple;
	bh=4W4bI7uebF/sEaVVeZOoyGw2rNdCSdxuqXpsYj8WkvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tznycGebc2ZEE835vAnPFQyQrmv8rLpNN8wvf1EJg652PIK4IdPcjUwO0srOebeLJ3eLMmkn3ieaWLEa7Z+rdF/QmleBqZriAueI8R0uXaRWlHCrlla7VIkhNW1v+9rlYgRcb8vqfR4NuN6l3z5w74j9ML2qmwjrXCyANQPg9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TzOjxPVt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TzOjxPVt"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3083884e87.0
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729011329; x=1729616129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4W4bI7uebF/sEaVVeZOoyGw2rNdCSdxuqXpsYj8WkvY=;
        b=TzOjxPVtwTwePqu9syXVCrDHy2lwFsKRdhu1gPpneBbogFxSKmPCKP8SISM0INj1cS
         2LChXQBnEpQwJHDDMzE9KXV7lpoW/1KSWhwS6uXK76325Z/MMO38GD3nlY7j6txMxisp
         EiVQQHfFLN2/XXgSXy849plb32QdP3RgrbbvDP32X6FoAO8CtQsthNsd5/koFe4W7FUp
         TSdv806mBWSl/QDtAB8XnX8Pu6cT3XiZ012fhVPURS2UKBE/LR9hlyp0zRyar7vaVrwb
         rNaDMd9eevFT9mGxEgDdS65RDr6njOkuQ13LAnZbja73D/+dp+j7pLAaRgsgepSML0l5
         BYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729011329; x=1729616129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W4bI7uebF/sEaVVeZOoyGw2rNdCSdxuqXpsYj8WkvY=;
        b=pzLQwzWBT3R/MiPWpYAsnLj2zGdKC1+ob7ktYQr58kjD6ZHvvqp4mxwGUWMmidcObq
         CmZvv/yCXEXzqPByx+ILZiHieiWzUCeGvt88nbeluh8K/zgf8cW8MGanf82ku2aYuY1t
         9fsxAI7sGYs/1H3L+mGd5b1IEbzn3B1MPNm9saVp7U9MTREEPvjC4pFxPNkPD1LIQewz
         F9unwtJ0t+nEjS5MWbh9YwPvb3WozAAieCRoJc5saO/PjhdD0nG1D2LUQ1ZNr6fSyYcr
         U6jCkQuUS1ltRQtZAsbpFyy/CpcgNgRR7/GrPKmjiJxmhvvKEGovsbKrcVljO585eUvT
         6awQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUmDiVSxjI7iSvkPmc9CQYfl9rj81UoK4P8DFomtTYPLAVJhtLwrpX5tZWVw58bEJ0dgaP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpp4M1FURYKjhmphSjFRui2f0hX0EhEN1hazoZmedaaXrd3xb8
	kYWYUcDx8hY9pD+jyhj/IP7dGUrRTu0Iqt3abwPVCDbiafVgg7ILJA0gyek4sg==
X-Google-Smtp-Source: AGHT+IF3AWzGgTg4Qvkr9yrpW5bAHI/Y5xkCPKoE4F1EumLHWDdTfzw5TEEu47mTMpVX9kE0u9CLEA==
X-Received: by 2002:a05:6512:e88:b0:539:f37f:bef2 with SMTP id 2adb3069b0e04-539f37fc3ccmr4140384e87.17.1729011328523;
        Tue, 15 Oct 2024 09:55:28 -0700 (PDT)
Received: from localhost (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a1a3sm2007771f8f.12.2024.10.15.09.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:55:28 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:55:23 +0000
From: Aleksei Vetrov <vvvvvv@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/vmstat: Fix -Wenum-enum-conversion warning in vmstat.h
Message-ID: <Zw6ee6PAz-kZzRAG@google.com>
References: <20240621111604.25330-1-shivamurthy.shastri@linutronix.de>
 <ZwRA9SOcOjjLJcpi@google.com>
 <20241008005136.GA241099@thelio-3990X>
 <ZwevGZHiXOBqoslA@google.com>
 <a2e8a76a-9fad-4e3e-bce1-bf8a9d180464@app.fastmail.com>
 <20241015084714.GA1546610@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015084714.GA1546610@thelio-3990X>

On Tue, Oct 15, 2024 at 01:47:14AM -0700, Nathan Chancellor wrote:
> We should be able to disable -Wenum-enum-conversion without impacting
> the ability to catch the cases that you mentioned above. It also helps
> that GCC supports -Wenum-conversion, but it does not seem like they have
> an equivalent for -Wenum-enum-conversion.

Could you please create and send a patch to disable
-Wenum-enum-conversion?
