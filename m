Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23192E83F
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 21:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728076529; cv=none; b=SoI2qa6BaX3BwU+ouxiY4apl/k4tlVY3CSTbUax5FjBiNgdqtp/O+qYj5+BNoEQPIzw3uidZIOmsFT2kMFiG02V9XL6KRXcEprS5CuDOq1++rxV1zPjBFiD6a5SFNhGvox09MONeKpxUd8/+Hyi6uZDXpp1Y7RgGBdfhshzaw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728076529; c=relaxed/simple;
	bh=Mbx5r2TKIMn8mhKB+ZeVXt4Prsj555X1UtYtHQwuAzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ywwnh18UlAUy4FGb38u/QVUE+G4MNk3x+Er8P0MqOe6E3QGW64cMXr3ErZqu9JU0iUIFIKkGi36NvIg9CLe7BQUeAQPq0d+15emp076/7psWivUaIs0Yxs9go/+2OdyJRBn8mqqruRv4WGh6Ux9K8ertLCdbwvk01RiZoG0KaRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=xPTA4Gvl; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="xPTA4Gvl"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e260850140fso2579388276.2
        for <llvm@lists.linux.dev>; Fri, 04 Oct 2024 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1728076527; x=1728681327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mbx5r2TKIMn8mhKB+ZeVXt4Prsj555X1UtYtHQwuAzs=;
        b=xPTA4GvlibYs7zKrbKmODz9wbSSbrv2vyxiM7e+AX3VvEBkXJDwFO5Qwzu/o5U/o+0
         RiYwpJORSXuwKefqAWp8UHCma3vkB+HbsSUX2MYp2GUf0dbzLPIP/iriKjtYzycRmcYd
         1e/ZYt/ukMeZXxkF8Ynxrl6jEZmE7QM4nh7o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728076527; x=1728681327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mbx5r2TKIMn8mhKB+ZeVXt4Prsj555X1UtYtHQwuAzs=;
        b=WhxZa04cL9Oklmi2mImn2qH2XEuNUqTwx2v4m+VqaDNQwo8AC4eaIy8ttxyvIjyJTp
         Na3NMlfmDGadOb5a0aTjYw8kXaT8+3nWziXMRyc7CvfIA7nCCxlFoXw3/4xvzoshckoE
         Cg0z36mxChhyVFF1JgCcuvtKcfY3EzzNPdfnsQTJECkt9NwESnGw6I8B5CZMMpavlU21
         egF2wQtS+ZrSYBa/au2sXeWT0ozRT4Fekz/SGVlMY5eFr+mQIevv6BvXAbP0HsvLRvUK
         DS4g7o14+WYLwkRseJni5BB2Kze4EN+B1eOdz+Szugq5C/4qJ5gLZNUB06DRNFnueiMh
         JYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlX9PsogKZhg6tc7BuTnuOdYUJGvkwz13NKUUYFFMHZVduhoU3Mdw9KzM1cIbQ3WLT+kPL@lists.linux.dev
X-Gm-Message-State: AOJu0YwOSq7XdZHuOt5HfKRwUTiAypE/eq7EZ/MU4MhUgAkHYp721Itz
	NluIUA0htnJx+RsBtAEgNMD30HxYmWBU/+BtaTM4YFxkGTc4DsHWfWAhno9CpkwBP74nFegOkEA
	hEOBoLAN62drqo5q1G9N5B/KRU2KZRRuIfBQPSg==
X-Google-Smtp-Source: AGHT+IEPsLMnMKFXypAW2Ai1WtaX3NPqnW63QWoysrWAhTsUF8m+CHhPihaOdD4n+hkJeUszvqpfldEllQccT98CgOg=
X-Received: by 2002:a05:6902:27c7:b0:e22:5b5b:58ad with SMTP id
 3f1490d57ef6-e2893944237mr3839551276.54.1728076526729; Fri, 04 Oct 2024
 14:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241004182734.1761555-1-mathieu.desnoyers@efficios.com> <20241004182734.1761555-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20241004182734.1761555-3-mathieu.desnoyers@efficios.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 4 Oct 2024 17:15:15 -0400
Message-ID: <CAEXW_YQL3wY+BSMw3SOxDWbczrVfe9ALz8wqRjb9iPOBJq0xHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] Documentation: RCU: Refer to ptr_eq()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Will Deacon <will@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Gary Guo <gary@garyguo.net>, Nikita Popov <github@npopov.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:29=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Refer to ptr_eq() in the rcu_dereference() documentation.
>
> ptr_eq() is a mechanism that preserves address dependencies when
> comparing pointers, and should be favored when comparing a pointer
> obtained from rcu_dereference() against another pointer.
>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: John Stultz <jstultz@google.com>
> Cc: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel
