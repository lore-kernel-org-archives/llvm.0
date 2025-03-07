Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32D2459F0;
	Fri,  7 Mar 2025 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741371888; cv=none; b=FYszu8KP9dqWIDiguT5DG/Yt24rMznfb3d64/AgdxM8qX1uFcLfKwhhASXncFoJK7U/tdOPDHIZ5heveZCw0T0XbFlRZ0lfiVFjS6y6ZdJ51r52lOITJzFRSa8NQ7h/kdExqVnkEUM4l1l0xp/2MspiQpZGP+Rdo6SWpZf35Km4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741371888; c=relaxed/simple;
	bh=qSuyCnhrQD8E7ryuu3/UD/TORYIHihne4n8+oj6Q9hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAlvZmb3MFauaOZ/PjaEIYkkii3Zigo2J2gzhNG49r7NrOpZk1AxsTG4B6wbHkT3YTUE/J54laWuogbBi+ho9x/FxM/Ts3Liyw13At3uX/y5TFu0GNVbFziKtFc6Zh5aVbgzzHeky/7VVK66wgOqp1zt9Lq33Q68UGTpQ2RkX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBBaC+Vn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBBaC+Vn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8755C4CEF0;
	Fri,  7 Mar 2025 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741371887;
	bh=qSuyCnhrQD8E7ryuu3/UD/TORYIHihne4n8+oj6Q9hk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WBBaC+VndlpTsCB/57ba30DAX84hn6RRy5v4VMq9sXy9PWmcYfhka7yn6C+rW6wT9
	 N5AiuYqpM2ycEVN8CUmUV4OyGlusJRURqFdKBrhlruIGkU/GC1Oh81QL/pqWSRUbQF
	 fQSukCbkbmtlFmkmZafbjcRUKVs5rywLYa69rjMXwxX5OzOxw8T51lTh5OM/DDM8B0
	 q+jOK4FaO6Kq0GbuFTO9Qv9KxrcIygfS7pi/A9MxoO+wQMUmKQMZy2mAEaKdn/tHls
	 NjfQb2Lb0Sq2U0rTRpZzYh/+XqTPc8iEDwAn0A0b58Qc6HOMhFcxZDYo7UAYzQfskO
	 LfoSbSemy0agg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5D8D4CE0B6A; Fri,  7 Mar 2025 10:24:47 -0800 (PST)
Date: Fri, 7 Mar 2025 10:24:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <c48fcf0e-ec41-41b1-8c25-53b09170771f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
 <DB7PR02MB36260D226AF2863E6F404B79E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <03c9e1e0-cd70-4b2b-b494-97b98449adde@paulmck-laptop>
 <DB7PR02MB36266CD6025FAB7701A344A1E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB36266CD6025FAB7701A344A1E7D52@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Fri, Mar 07, 2025 at 05:59:49PM +0000, Puchert, Aaron wrote:
> > From: Paul E. McKenney <paulmck@kernel.org>
> > Until such time as the analysis is carried out after inlining.  ;-)
> 
> The idea behind requiring the attributes is that we'll never have to do that. We let the programmer specify interface preconditions/postconditions so that we don't have to inspect the function body.
> 
> Inlining has enough disadvantages that it will probably never work here:
> * Since we're looking at individual translation units and not the whole program, we might not see function definitions. So the analysis would behave differently based on whether a function is defined in a header or source file, which is undesirable. Some definitions might be in external libraries and never be available. 
> * Even if we could see all definitions, there are complexity issues with inlining. We'd have to draw a line somewhere, which would make the analysis unpredictable as well.
> 
> But these are just the reasons for the design decision. What matters is the decision itself to consider bodies of other functions as black boxes and only work with the attributes on their declaration. I guess we could also more clearly document this.

As good a design decision as any, so fair enough!

							Thanx, Paul
