Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6D2CCC0
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639623; cv=none; b=kkKF0KwWUFHK4u+LSa+sylBEco+mUKYsBa45T1CAfUPkcXwCwRZgn2QidBF+aWDROCfqkn9fk9e8HTe+nn7aNxb/DWjSlEK9ljVt2utosHfY1VoWZY6r3vK0VSTk48qF/waqDy9cRz1Q7x23TFtd7FD/N4HSYMAaH2d5R/m7oZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639623; c=relaxed/simple;
	bh=Ah0Ok8u2jvwbArCTA7l4DjY9WAjqP5uUmepnny/Z2kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXZrk5s05ztvt2L/s2/0sLiHrzi3IUphQPwP/izKvlA3Ut9dCBKazoOSLXxXDBROwEoGaEl3q7T+AzZCFF/lFj3d057wkv0fznpKYTotcBvbddCzelxnBYh2rj0mtJTvz5Puev30E2fbpSjLIPaWDCtdzg/Y/3v2jYfpO7oYk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qGOtNyNf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGOtNyNf"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fea65dcc3cso747157a91.0
        for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 23:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740639622; x=1741244422; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3B7a9PKqDfPLxt+uZdMSLJc6wZgnR8JO787nsEWqq0U=;
        b=qGOtNyNfVdK0Q9Eh3ymr9iiPTUZLujg1S+5aTHp53r9SflYVnzAnrP1yRKtYaJ9SSN
         ttvoO2YH1SNkP5tmk3MclOVbzzsFdYX95508Htu6KLOpVjsxYpF1pvxpEzTPT7vsVn2/
         wo26Yno2QfdpzTkuLu+69QGEceAzHr6sIidtRp3sSz9wriwEubhTbPoniD0k3Rnq51Ia
         HsoIT9p2eGWSR+tNTwvR5IuDV05IHm+i1bmQH2u/2+lQFOdo65vQW+zFJpmVDcj689o/
         j3GqXy/R7RQknbJb43BeK0pd6E3DsXWNxezFm5rapY3ccEtqzgxU0UloAjQlRVaxvTeP
         uSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639622; x=1741244422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3B7a9PKqDfPLxt+uZdMSLJc6wZgnR8JO787nsEWqq0U=;
        b=PBipuqfiunbz5+2MfKUVQeaj4dHGfLdW8XyPElr5xdVqCdU9rqAvw+hPDnjd4qxGr9
         KkSRz8UTmQX86wLoXHPbDJyZGutXAMsJD0nGXR5/jgjDTV5ZI3DI6vl7HHbUPQulcrCS
         1vo0D6Upa2NvCEIpjEwtPsQ6WYTKTBmQdbaFnrucB5LHHox6AiPwMJ73/mUFtONlDiUM
         J0lYhpa57yANbvUXKiTTqnICnTrXMNstZ8UyJMemOvW88egDdpLg5nH/y4jDkhQVV/ai
         FHxOpWuKX039baQB2BZIo5QF7xXLAcl2e1pZWiXZzhXhGMJEgoF7HkbBacCGyBFfX9fH
         UIaw==
X-Forwarded-Encrypted: i=1; AJvYcCV5pDp5494d5y2Iek5QskqVdlS1s8pxxUa0NuzPj35jhlaw1Cpp2AznK6SA2SjEHt+cH2YA@lists.linux.dev
X-Gm-Message-State: AOJu0YzNtmDKOqmmtU+PgXsC/o1E5uhBxZ/4rH/f1xx1xRqPrlg0riXl
	km6oASJT/VbHpROS+W77UDP5b+zGQ6r1j9rK5fs5IJ6JEgiEcf7LWfpIvFhepMLttO1y3/njlwp
	tvaWUvhDmp1ojJ7qoKp06yKZf3u6eNWsI4jHb
X-Gm-Gg: ASbGncuLAQxT5NRlBCmrvvMpRpFDaz4YvflUYb5DfurRCrAmDoMe6qWxRaj7HKy2oOW
	uWlZBCf9+4LkdCU/0kLRxY+6hJs2h76m02ZmHqR6RwFFh70R7ZonDwZhMb3sdQTklBuVfdYhfxJ
	CXT675Mgr//ZCBJlsk1FPQukAGQyJpEANbYeM4tA==
X-Google-Smtp-Source: AGHT+IFfzszcK8xz3AbKXR7cq/ASZditUq/IPM5LeqCUO3BVtZeQjerGEcaCp84fg3Mzv4RyJIt8ZyiiSg5FyAUsE5M=
X-Received: by 2002:a17:90b:5148:b0:2fa:17dd:6afa with SMTP id
 98e67ed59e1d1-2fce86cdeddmr44583103a91.17.1740639621455; Wed, 26 Feb 2025
 23:00:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 27 Feb 2025 08:00:00 +0100
X-Gm-Features: AQ5f1JrZWnMR4OE-NBvXmFaojOYjcgWnnmEzRSN2Q8FKZWV0JX5T-ip-Qb4DfME
Message-ID: <CANpmjNNxb8f4QNQE+3oprwfhbhZNkiN+JJMRAzMa8mHXFkksow@mail.gmail.com>
Subject: Re: [PATCH RFC 00/24] Compiler-Based Capability- and Locking-Analysis
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 19:17, Marco Elver <elver@google.com> wrote:
[...]
> Capability analysis is a C language extension, which enables statically
> checking that user-definable "capabilities" are acquired and released where
> required. An obvious application is lock-safety checking for the kernel's
> various synchronization primitives (each of which represents a "capability"),
> and checking that locking rules are not violated.
[...]
> This series is also available at this Git tree:

   https://web.git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis/dev

I'm planning to send a v2 soon (Clang just gained
-Wthread-safety-pointer which I wanted to have committed before).
Preview at the above tree.

Thanks,
-- Marco
