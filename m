Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E117B50B;
	Thu,  6 Mar 2025 23:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741304664; cv=none; b=TFjb8NuKr5X3fgVa83Io2DJW4HBm2I7jqdbHZvkRf5T/vfiPkKKfkA9GaEDlq+Fr3rDAJN7KX9CEBDRh7wa6zt5hM79JL/fwGzp731M1SOSOQHrlW6vLGfFOMyCMq09LWSs8dAG2cZSD0tdxwve92I90IsaYw/FwQvezEfWHwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741304664; c=relaxed/simple;
	bh=p4G0Wc/gUqMpVrofSQrVWfzwjd+Jgwjn4mu1XaOwHXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmiYXcUqFawUvDNht1MEvlMzUI9ifTEknw0w5JK2h0jY/QF98e9EtJfd9jfqxZsTxBpgQxFGLxRdQFCSxS0opelWPsAK40qDyBnj5yqAcctf8KyH7sIxKre7gNlo5XdWCJB3YO3iMrB5TlYeziiblenlfUeFdemNrTiXIrcsJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9TkWoPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9TkWoPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD61FC4CEE0;
	Thu,  6 Mar 2025 23:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741304663;
	bh=p4G0Wc/gUqMpVrofSQrVWfzwjd+Jgwjn4mu1XaOwHXk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=L9TkWoPw/88SR+MvcsKYbT2ulK59p8rpRAKWaBiK6dotc2GdnkwQ+Vo2jtYFt3663
	 JhNFfgJLe0aPQ9O6LLdoQEu4HYOomJjMZCSfun9bM+3IWHuJRafiWRGbukxOxqT20j
	 VEAGMX0gjx1BK9PqwwJ5vDjGSfac0GRZH1mJM1e0nGdl4stWucvvZ2OSHEEYXWiJMl
	 cEE16EJntjxTuqP/sSS7sa5fBR5MEDZGqlXbdwDiGjPQ5YoMHwS2x8T6Mp5is9do8X
	 uW44s/7DpnHV/m/vXq6Bya8drQUg9WccQO18UHeCB6Xy/81KM5wEL4JikbIkTi4aND
	 ULMfQ+d5WTQOg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7924DCE1163; Thu,  6 Mar 2025 15:44:23 -0800 (PST)
Date: Thu, 6 Mar 2025 15:44:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <03c9e1e0-cd70-4b2b-b494-97b98449adde@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <119f37e4-bbcb-403a-9f63-5b9001233c0a@paulmck-laptop>
 <DB7PR02MB36260D226AF2863E6F404B79E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB36260D226AF2863E6F404B79E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Thu, Mar 06, 2025 at 11:24:17PM +0000, Puchert, Aaron wrote:
> > From: Paul E. McKenney <paulmck@kernel.org>
> > On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:
> > > Re-entrant locks are thus not necessarily an impediment: if one function
> > acquires a lock and calls another function that also acquires it, the analysis won't
> > complain. It analyzes functions in isolation. You'll only get a warning if you acquire
> > a lock twice in one function without releasing it in between, or if the function is
> > annotated as requiring the lock and acquires it again. However, in both cases the
> > second acquisition can always be dropped. You can argue that this isn't a deadlock
> > and hence not a bug, but the acquisition is unnecessary because the lock is
> > already known to be held.
> > >
> > > In theory I could construct cases where there are still problems: maybe we're
> > locking twice because we're calling another function that unlocks once, but we
> > still want the lock to be held afterwards. However, I've never seen this. In our
> > code, re-entrant locks are only used because the caller might already hold the
> > lock for some reason. The sophisticated patterns that I could think of never
> > appeared. If this is different in the kernel, I'd be curious how it looks like.
> > 
> > We do have macros that acquire locks and enter RCU read-side critical
> > sections.  Also, depending on exactly where the analysis is done, static
> > inline functions might cause this to happen.
> > 
> > These can easily result in a function with nested calls to (for example)
> > rcu_read_lock().
> 
> Macros would be a problem, functions not. As long as the function doesn't have __attribute__((locks_excluded(...))), which would be pointless with re-entrant mutexes, we don't know when checking the caller that the callee acquires the lock a second time. Similarly, in the function itself we don't know where we're called from, so we don't know that the caller already holds the mutex (in some cases). We only know when we have an __attribute__((requires_capability(...))), but then it would be pointless to acquire in the function.

Got it!

Until such time as the analysis is carried out after inlining.  ;-)

							Thanx, Paul
