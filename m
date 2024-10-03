Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394301C2DB2
	for <llvm@lists.linux.dev>; Thu,  3 Oct 2024 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727993403; cv=none; b=NSQW3fgXelL3CyloEiMrwN10UahOmdp+xTV1hR2MXZnTekcekEB32bP+mqItB9acMmSuJEq0MY6DkGDhkk1m6hCyAas4AqdMsva15/Zl+bbHp+SMWQomzELunGiKRupYxHvtte2eYYlLZOxPade3ZDu0c3Vebh5KNPxQVPuHZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727993403; c=relaxed/simple;
	bh=RIEY/VvBXBpbOFws0YW9ZSyNHIhNNXGVpnHlXG+8ISU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNVoCfkkGy8z55OuRkgYEFEvBbsGaXP6By+4DgfQioLAUU86ccX/ess5nFr4cjkGVEH1FkVhyYSshpD1atq7QEhHL/U6gl8kR+RbOlBkLRZJ28/MAXtGbCezY1Qd1dpBCE5HaM+CyxLwCGlAyItRbTwLLJ0dTEWB6jP6w+jqTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=RJkxQMVH; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="RJkxQMVH"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e25ccd64be9so1326722276.2
        for <llvm@lists.linux.dev>; Thu, 03 Oct 2024 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1727993400; x=1728598200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIEY/VvBXBpbOFws0YW9ZSyNHIhNNXGVpnHlXG+8ISU=;
        b=RJkxQMVHWfhDIcHEli6BGvnXWu0XcKlI6iSukWgDlFGy2B4gq52jNq2Wymd5Xd2Yok
         UCQVhamJthQIx2pLEeUK769UFFD9Q8/OQq++Xmx8XE2L8QnEdCSHulxKb4ShgHBr42Ge
         E9Z/+vNlb1j9uUHAP79nNv0GakBoY0wqoJ3zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727993400; x=1728598200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIEY/VvBXBpbOFws0YW9ZSyNHIhNNXGVpnHlXG+8ISU=;
        b=eRO/wxRFxkTab/VywPuHDXl7Xn6Qiw4IQbireHMdpx03Rh8Mpr17igxlsQmGR+gZ7I
         V+oxwbte0jUcQkQPVbiNuX9rUP88lAifI7gQZFfYle2baAdfeE0kwXERVwHlIysOsGJe
         1zgTYoa2fO2Wcu15o+DaCRPSzbyN7GGWsuiQCgz13IoEboCt7JGynHo/SEnc9wxChmrE
         i8zPTeFHJ8TLOsBRIQG8I1/SpeB+pKrNRXOTXCaZbBZBzNcUpp0qcYq4AvVRh2YRyJjL
         E8SenVFAyeaLaZNPGXa/yRn05px5vRne4gjN4orBREvmHy0Anphv5w0qSSfo+COVhkSb
         aH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX22maEJQR0RUFRPRPItCX6s3Qia9DYWaOG2cVHTdfSlQkzSRkfs/6/HYPNY0p1aOKVgFc1@lists.linux.dev
X-Gm-Message-State: AOJu0YxNa84ZU8enKlDZlx2gvpFeLzL/Y/KPo4qr6DQxxR46m8Rbmio9
	Kac4P4a5FB7YIBbIr90S0Uk8gFeNlSSaeFPCyzT/iAq9Y+mPjYxB2vXO9drACMKxfIGdaLhay+h
	pf6r33OX6dZ4axq1uLwoba47U5o+uknVC3i60mA==
X-Google-Smtp-Source: AGHT+IGHUNzUYhVLVAPDGU9H/0WV5ShOsg0ptxWufYbLbDAiDNM07Pwk/MoJ8LvG3kzNc/NTlu+JDUt/1ryUfofqvJ8=
X-Received: by 2002:a05:6902:2b8e:b0:e26:11ae:6de9 with SMTP id
 3f1490d57ef6-e28939561eemr459827276.52.1727993399239; Thu, 03 Oct 2024
 15:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
 <20241002010205.1341915-2-mathieu.desnoyers@efficios.com> <20241003000843.GA192403@google.com>
 <7cc83ffc-c9cc-4e87-a3ee-bb62588a594c@efficios.com>
In-Reply-To: <7cc83ffc-c9cc-4e87-a3ee-bb62588a594c@efficios.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 3 Oct 2024 18:09:48 -0400
Message-ID: <CAEXW_YTO3AhHAqrA4E_goVbsNB26AdfdShynr-nNMR97AYy6ag@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Mateusz Guzik <mjguzik@gmail.com>, Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, 
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, 
	Gary Guo <gary@garyguo.net>, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 10:21=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> >
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>
> Please double-check with -O2, and let me know if you still agree with
> the patch :)
>

You are quite right, with -O2 I can indeed see that the optimize hide
var fixes it.

FWIW:
Tested-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Thanks!

 - Joel
