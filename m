Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43037B667
	for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727625061; cv=none; b=RWrTzaMvLLyJz6yXxh/AZl/cCT8/oFzcaT2IiwcFSbv/iNYLn6+yD9fw3L+s/kW1mweqlG3Yqi2JSGlfDw370MNEZHVR1AvsxLVGZxcDqMMOt9Dnb9XFlFE4v/c1dOwFeI97If/sgV+NXNdtL53qkjFUHdAEIF6ueyCsIuqsrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727625061; c=relaxed/simple;
	bh=JZxrYxpziZiNH0RWp1bEPKptpq2xXzmCutmdLJ4h9hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVPMH6J2ekN5tEeGqAqbafZoxv68K6GYZuyCsvSKl/EYPjOu1CgRaT+CYTqWYlGwVncybRfOQYFEhduQK7ZBhVvShZjPLi9y5EUeFokerBLrOImZH1MxQNa6oB9rl+uZa5YGFlLeW+R6Du2hWrmbGkxahRD5jtppNeW1XRg02Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wQoqQOct; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wQoqQOct"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cb399056b4so26709226d6.0
        for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727625059; x=1728229859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y2D6qTzk1N1f3m0kRzoxA/mFWQeqmxquaa8AlYdeFM=;
        b=wQoqQOctmJ1TfFuMZtaOhqvtejZtQV5CDjgAuXkDxsfwrZ+Hf2QAagGztEe+VRGHBM
         tDXKQ54QkMQzPoiyswlv+Zr6uTdfsjy7F7aXKppeh6aV5yPW9huO9Ys8wPl7p+3k1OtP
         6GsdVacKxzfn8VPodmOc8rkXpOxxF/5+XdGm55XAOKXGqrL/NrP0U/2vXcwyn5slRVHM
         pTssYoyW4VCUn01IHuUIeAYjsVuWx0a+wlC14wc9c/50/yKqyqVmDbWw118GFG3ddUum
         LGqD7Kxsg9Dp/Hugfky8Uc+aC8UVWjYZU0ilzE1obmO9XCWEPw1aYp5KCUBU/+Xfz/3M
         lk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727625059; x=1728229859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y2D6qTzk1N1f3m0kRzoxA/mFWQeqmxquaa8AlYdeFM=;
        b=vAdk5/13x5Q0lUsfY/r7dIHAcIL/kswMRUK6N+sHox/rkXp07upDJaWB3QhYDfNkSZ
         ZdXvyGyCtM5cWKyVLA1dWW0XEG81ozFxrf2bOfbAZlo2Gg/vdxG3PVkg4fAPHgo5qbHp
         ID3L0SBJmcGwq1ble0xtd+nlOJhEzg51QH54KBV5GJCwMg0HikCUQe0V01UxV8+iqdIB
         3690iLr7v0PDQJiSlUbm3n85j0ooFxMIMAi4ZRTCnlKH3nGZ6dFVj/ja9ZSxW0yt1xK0
         O2X3X4tq/Nip0nKMEI188ZmqjiKlxvfKZzGoY5O1OWA1eX3qlQ8NFRfb4HiIP9IPGzMy
         i7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8nxJMgT0rR3tNN/Ntq19p11aqO38Ld2/uX4laCDy6wbrSiJ7g8+wEQMqTYDrOerjR7h7T@lists.linux.dev
X-Gm-Message-State: AOJu0YwMb7kD1ukNqz3pwnsyKqHg5ILTLqBecM3JpZc9mVJ/2JJ1M7ik
	shjlZN6YsfrSCkUw+2YKpb4vLUxHfBedvMkqNbs/HslDbeSITquNtsuD6Z3b0g==
X-Google-Smtp-Source: AGHT+IFZuEPBZGMBb6yILvpuGoLBRTg0zQfGWndE1JjdQ9u9RIGWwrmtLSM5wwVtRT+ilMvEG3tiNQ==
X-Received: by 2002:a05:6214:598f:b0:6cb:2d18:dfe5 with SMTP id 6a1803df08f44-6cb3b65a8femr120236206d6.49.1727625059122;
        Sun, 29 Sep 2024 08:50:59 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::abbf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ffbbesm31867626d6.25.2024.09.29.08.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 08:50:58 -0700 (PDT)
Date: Sun, 29 Sep 2024 11:50:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev,
	Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v1 0/2] Introduce ptr_eq() to preserve address dependency
Message-ID: <df54d990-537a-418d-b748-7cc140eba236@rowland.harvard.edu>
References: <20240929111608.1016757-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929111608.1016757-1-mathieu.desnoyers@efficios.com>

On Sun, Sep 29, 2024 at 07:16:06AM -0400, Mathieu Desnoyers wrote:
> Introduce ptr_eq() to compare two addresses while preserving the address
> dependencies for later use of the address. It should be used when
> comparing an address returned by rcu_dereference().

Both patches are now much better.  Thank you.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
