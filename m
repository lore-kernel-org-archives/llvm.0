Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F2611E
	for <llvm@lists.linux.dev>; Fri,  3 Jan 2025 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863903; cv=none; b=gjJKnr+P+91ECpTxWi0Yu7uC9pOw60E/pjXu5XJnr1ygsbBfbx6tndeXcazRBv6BR8tVj6XPTq+58jUZv7jgREOjwvFCygs/rIk9d95ZT4oZnVxo0IC0TwcYnF6EKlbj6K7gc57eyasZ4CBYYZ0E9tJ9cCJJUVh/20lhhIK5MJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863903; c=relaxed/simple;
	bh=JZYO9PPavHcBEPWGuTcvM+j/t3gJIxWN7YL4o4FoqJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb07bWIM4ieB7hE509wCo0+EXVpyKPLaevHa/Jimti4U99jQ1NO1RbJuJTKfP8tNxYKQA+857TI3ho0zxBAIT5z7ljS7F57HLBNTggMXHF+qXze9vbkh6+PDu/AHvhgvpWmJYD0FkpqMxFQvpz/VN+pSqjD0w8/jVZxhvvbWfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aYrPR3Wg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aYrPR3Wg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so3218a12.0
        for <llvm@lists.linux.dev>; Thu, 02 Jan 2025 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735863900; x=1736468700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNzpgmoCzAwb514bhoD5BPCvyAJMbaE9RvBKoPbv384=;
        b=aYrPR3WgytR3K8CBrTkoIcK5lvEU7P6yGvC4ac94dbvTLZG6Gztzp7PlGI3tSmTOIk
         f174qcQjaOVik61y5ugtaY0gyT+6RwT25MHoClgo/BPScSTGnCyUPHDTFIUWD2AIpa1V
         3jvgMEEZi2KXZNfUsd6aw7jmAG1RIKKXgThwMKN6TkS1PBv98HAmcvZcTrhqjTSXU7ZX
         8XsVUYouhYhHVQcAYN8dpXWcvrByzYJuq0vi1Cn8RTno8NpGBzZW8GOrUt1WJldRpecL
         uAT77/1lkH3IGEpR5EkfLwrcUhwXQa4kZaiy1Q2U8gd9KNxvDDCqRDHmQOkBmMl9OEtZ
         dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735863900; x=1736468700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNzpgmoCzAwb514bhoD5BPCvyAJMbaE9RvBKoPbv384=;
        b=kRbPMlJBfEnFIiBurDtLfTudPvcG1q90Bs7c/tNJE7GOFedJpN9N/amyr7RhvtZ0Fr
         yjCpUiRoGYX1xrCeUr/0sl5Padepx9WOytrl4sp2bOc0ETe0McYLDt8CN7mXGIS2flDU
         udYZEbfeK6FECrajNXsE6KJilf41U6egU9IYONd142m140KDQsIVmkbOabGFARadO/xA
         g86lo2QkduF7zQKOtyg4Mu7dPNnjUxABJOSEhYKGn2MLYE0H2dRt0QlEgDNKuA7qGr8S
         jfxpp/ob6pRJ0Xh0V1/1E+XfV6RGRNgIEG9PUArT+2Jq6S2RxtY05Fpji/DSHXDj1tDu
         KskQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Cui1yvimM4icoBxq5AbcdcttQE/2fnTgQ8GG82YP5iT5H/2gVphyjBIu2AqHX/eh9/JS@lists.linux.dev
X-Gm-Message-State: AOJu0YybJXEWpNaJJAi9DAzw0CWP6Vhnahg7c4PQgP9aiYUXAtLQnrPO
	nKhKJQXdsyPHdt3plPCxeVfX+uTB569z2yYqRe3x4DgnrLpIjpJVyBSPztXhk4EcgSb8dHXPEHp
	r10VdOiz+NP391hf2UpUlCZO0Sh9B7NjRuFXs
X-Gm-Gg: ASbGncuwEfxqMXYdGyKoV5OYN8Yx7GVxYlMbXexRxAXVK5Q0f5pLtOhVVLo382l8KG4
	OwkltPDtGQv7TvESNUV9LpItogBYhS8V9Tl8=
X-Google-Smtp-Source: AGHT+IGQAbpr8horQ2fysiJ3MPMS+mcd+xtgrtyaVmH+uGzcUwbPEeJQouzoojRERX+UqkPJPlPOptSJ/ishqBAiBkI=
X-Received: by 2002:a50:8712:0:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5d917875c13mr5922a12.1.1735863899573; Thu, 02 Jan 2025 16:24:59
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-29-bigeasy@linutronix.de> <20241230185812429-0800.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20241230185812429-0800.eberman@hu-eberman-lv.qualcomm.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 16:24:22 -0800
X-Gm-Features: AbW1kvaRDs2xYpGZgla1RZEmBOvM7PAkjYw9im4dG5fjLKcfN-MGKXe4WhweCw4
Message-ID: <CABCJKucZKvFcTQEqbKNUfdYv-upxsH6cmw1=iHUORPFJc+vKHQ@mail.gmail.com>
Subject: Re: [PATCH v2 28/28] cfi: Use RCU while invoking __module_address().
To: Elliot Berman <elliot.berman@oss.qualcomm.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Elliot Berman <quic_eberman@quicinc.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Elliot,

On Mon, Dec 30, 2024 at 7:33=E2=80=AFPM Elliot Berman
<elliot.berman@oss.qualcomm.com> wrote:
>
> On Fri, Dec 20, 2024 at 06:41:42PM +0100, Sebastian Andrzej Siewior wrote=
:
> > __module_address() can be invoked within a RCU section, there is no
> > requirement to have preemption disabled.
> >
> > I'm not sure if using rcu_read_lock() will introduce the regression tha=
t
> > has been fixed in commit 14c4c8e41511a ("cfi: Use
> > rcu_read_{un}lock_sched_notrace").
> >
>
> You can replace the rcu_read_lock_sched_notrace() with guard(rcu)().
> Regular rcu lock doesn't generate function traces, so the recursive loop
> isn't possible.
>
> I've tested:
>  - the current kernel (no recursive loop)
>  - Revert back to rcu_read_lock_sched() (fails)

Which kernel version did you test? I assume something pre-KCFI as
arm64 doesn't use this code since v6.1.

>  - Your series as-is (no recurisve loop)

Note that this patch only adds a comment to is_module_cfi_trap(), so I
wouldn't expect a functional change.

Sami
