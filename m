Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645736;
	b=qfbjTKKo2anS6ZdCqATlfhUd0G1YKpvqXIiDXa9lXZwXDmbOplfvLvPyWjghvaTbauLA
	 iaxN5yknLfULG92AV5w1tXiGso8i1+6kFIX/KfCnKXJflfczh/LL3YwnZC2nK7VTeiWaI
	 vi6hBntIHXK9gEfQkkj9Ysx7CZ6b2xJTYhVOx+1khyO7wA2VMxqXLp+FGggjHxGdBcdwD
	 t9E/h3WvbYfiBvZqRbM+o760ecgzwti9MYRLfh4RhTAya19DeufUb5J1MWjYsBDpZ81uu
	 zHcWEghF8AXoZ0iADgAAe2Hz4gh66rTxDxJDqf+x9cPY//CJTvmCMSgvsOHwPIm4XDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
	b=l8x6LogTVhkHya9KxdLFF7Tfs9N0j7+MAZGaEND3aVoqfw9UrwuoJVvD+8gernY9wNjM
	 DcC1ZRCnSKSrqRqEfTei5cK9M/SExxGo3bjetMFbQ7qBp60WX4yyxpcgCtzRXwnSsAXGy
	 EmMnGKo+sjfLR+9AOQsy+d+dDUaQBCTmRRj/YgPdGBk02IfARgMFj2sUqLE8zizvnI3RS
	 hufmZItdNwKSdbwrWIueJ7x3MB0EYlXjmPTQA2902BAEMTicDGPvF/kzgbelgfZQS7gOe
	 c/zw+nOpPsN+DZB+j/87PLS7MGllNw4JBo0U+UgpNkOmalympxQuZv/a8NBQBOKO73Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJZCcGkR;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914B606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A914B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJZCcGkR
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso6836513eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645735; x=1796250535; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=IJZCcGkRL7MlMQ4jt1lo389pr1s2ds8cxNqvS4tlz9NLhPqLf1uoRXzzNOCG+1rzQ+
         WZkuV13OtN385mN8hl6ppRDmIBRgf/Be/RO14wouXpWIJq3AGol0TG1qGOqDPuYf2tec
         /BcVWjG7lVv6mcXCr442gAXUpok3wfZ4FnzyzegnBenCHsOiOJMXwWNRP3i7AcQFGCVm
         BDFIKTlQG6dVpKlBww8KfdkMJhq9E6dnxiVzy1D+689C3BVXZtWFT7z+9bt4JQZFWJHs
         4HCqo5KiuC7sUKQb38m51XdxLPsJdl8MLwo/Sg0UCOFyFGzOBxg+9hGZrWuYif8fW7N0
         2h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645735; x=1796250535;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJKxUb/OYtiZmUaTC1b5p1/oY/CxsBACMnUtWish8DQ=;
        b=rJNuLdyYTW7v4gWhYPyh8FL5G9NwOQflpyLbvxCH4qNeSxj5h/JN3dvLaDPMzTW99x
         6vDsdDi/M+X4kT7HH3U4YpJRSGIyb4/S/JWi9dKsSPNad3PudbuzOLvMOX7CfJeqf1cK
         dc8Mh00VmparMFToj3EqAxcP8Yp1s8dAA/3c3dF1YGoEEXtbQEsHvQINBp7MvyJCzYQy
         xQs338Qkwg9mxlfyjMxt6ehvhv3YGcpephFpBq38RPi6cTRXzJuriZghvc9VrE2hwztK
         oZEA1cH920CIEETJVr/k12WfaOcmWkQddry8FO/blfQkXXAWC7bqrFqZc3O9+9s7nqI8
         L2XA==
X-Forwarded-Encrypted: i=1; AL+hErG6sNZmUlodTJfmPF7e3kkN/unwSJSpFxc6YIsbHX6v2POa1Y7uQgMAQCgjD01+c+F+8d7s@lists.linux.dev
X-Gm-Message-State: APuU4Z9/ra5dWKsSsWypj9m186hXybp33CqK0WDzt20r9YbKLjP2oz75
	wT7cwlP2JGmax+OHqpCuZFTxOUsQ+7NMFOWa0UNIQBTtvVbYg3BEWrxRH4NAhHoryUjQre4Rp8T
	tVw==
X-Received: from dybla7.prod.google.com ([2002:a05:7301:1a87:b0:381:610e:404b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50fa:b0:384:6487:b155
 with SMTP id 5a478bee46e88-38570c359d3mr21814023eec.29.1795645734570; Wed, 25
 Nov 2026 14:28:54 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:26 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-1-elkin@google.com>
Subject: [PATCH 0/2] usb: misc: usbio: fix fatal URB resubmission and probe
 maxpacket bounds
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  usb: misc: usbio: stop resubmitting bulk IN URB on fatal status
  usb: misc: usbio: validate endpoint maxpacket sizes in usbio_probe()

 drivers/usb/misc/usbio.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

