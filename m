Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691532;
	b=UrMX2lzIXiYMkRW1fac18FUodrfXDV/jh+Xg7UgyDZC/fSDG0B2PJeRaA4cFRS/m4I+a
	 kIKYW989Ui4t9U5d74Gv//hOToYJduZXT4EdhHwDM5WdsQ0LsLiKpvt3VS6cOri34DJe2
	 EDvBSmpJtCTAnjUzw/s2b31K8iAlVQiwlHM6erB0bIfFmx5KG2pSW6AYVu3QHrPON/Msf
	 SpOjZ37tk5kikeqzxeIvJQEuoDbfTbieUfV1xXn3yFXugMAtYipF1cTNNCWazwVHAWcUd
	 QGtMFrpp56AsBi+c1jao7TnXGJGZCjCL3RgrbKAAOTG+mOlticJgjlGphocDoBL1s9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691532;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
	b=rI9YRtNP3ROXRWUbdmcN9VD8ah64HMFRAeR8GFebYSQkMN/w3HpWSh8BCdi261Q9S3Xs
	 9XxtV2mD6w612DidDOa75Q1cuyoGs+x2H3EDyooyAwT30t+SFbRMvICHi5swCIJENN/lJ
	 wptz0xrZOjm2ibNUk2VRh8YXgl2QYihd0+QbC+WmaA2r+A9R8Nk1DJ/do59gHHnPQjUix
	 /4G+ihbgGoJEmZk/OmE6aruIq02Keq32js8agZUEgSkZ0GwgY2Vx7PuZIOtSfA02WUuux
	 uW4kvIYC+L73Mu2O+gpyIs+LYb4qJ1D/TXAAF6imSyB7Iss3ssc57Vzas2O5tndjwKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfZ1kP62;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB65606A31E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfZ1kP62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795691531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
	b=NfZ1kP62lBJhCFaL7AzyO1ECIE0/NYCh+NNbvGO3+xPhDVPyldUN9xnX+yNVjtVIxIqBts
	+/V5XjGOEike52xFNr/lDFRafkeV6eyUaxEwv+P50eYm0XSldZlCCmOaZ+p2uMRWMxiFen
	g1BDKHDV2N+DwRTh96bwSG+5zpKmM9U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-d8--rMG0Noudwq0-pRZLaQ-1; Thu, 26 Nov 2026 11:12:09 +0000
X-MC-Unique: d8--rMG0Noudwq0-pRZLaQ-1
X-Mimecast-MFC-AGG-ID: d8--rMG0Noudwq0-pRZLaQ_1795691528
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4bcda4c853aso313641f8f.0
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 03:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691528; x=1796296328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bantJDujBdPXRkbIoqLhEHljHB1m6SQlPYF9yA+ZR8=;
        b=VZtijeASwU13n684PYKiyTBRC+eBhKEGFXIkgQUg/WA8LhBe6xwC4I1Abv4KuAJ/N4
         79jKn8Qk6jpJSmFNQdlBwuyFxPV1BiF1iSNCttSxCxALnSXFDDy61VYC6/g7sB8TsQxQ
         5uOHPmMOlzhhOghXslC9GvfS2WS6lQT7ZB9bUWzpTYEK6afDEv1gzBr//J62Hx99695U
         Ywr83y8FWS/rph+Hp/oCp7JfdCcsvPaL7axna4PP2rGygcSm2qcm99NRPicMvNlYaHqu
         qGMfM+/g6/QD+kEpbNdotPWfLSopO1jfk2Yc1BfOXm618EaIiszxKBeZq5igcCCfDAMO
         /qPw==
X-Forwarded-Encrypted: i=1; AL+hErETGA/Rt1viFYsCpz3ko5zHS6FcLWGTCwgCQR7xupZmIoeLSmDNTElqrx2FS9+TQkeqmTiK@lists.linux.dev
X-Gm-Message-State: APuU4Z+Gurekoyl5TOQIC31nckqhSDxy4mh0rgtSrDDwr/QxmMI48k+0
	REV0lrGzsCsju9fAZyFqFcAvxBeqe64MlVhwlxBuIT8Nku3tJT13b1osQUsN17mYC/iE6WgqXzp
	44otjQ4m5KyPh/TFjtntg3FA+7XAYLcpWSRb5O1GrnVXR4PiXC02HUC4=
X-Gm-Gg: AZFdTZeykDp0/pttlRPFToqXTuUpqt+5JUaLQRu/1/I+n0lI1Qfh3Wo4szlmQhb4qqv
	eO1L+BSkLjL9/D7wwQXcwfYgFfk9VOG5EBdvf1imDSJJe2SaUD01OEmALAYk3x0FjiW4Kihj6za
	qJnl4whGtcpw5+UPcsnVCET0+/8u+/M60QFHGPV5yD8tn+0Mq6D5uiDt1MZkla5M1/Pr8seiZ35
	GFHUd5vznl2qoN7xhpHJaE17FXfxiUeOAzPFGV8xU+0H24VMmBoCiYITToEPB00ef+3Zz3Xi7iM
	REouz6KTb02GHRY3hSnUQXzGeXxUTROHEREYXsc/JzgJw9yOkvnu8zL8j6vOy7fk6JD4MEFlvlK
	tjLdAQuUcBNhZiabjnf6zv1yolFLb4kUh8MypC4Im1NurXq+e66ZCGJFyBb3QoahcDZY7tUeIJB
	wlqYm7
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr29541071f8f.47.1795691528421;
        Thu, 26 Nov 2026 03:12:08 -0800 (PST)
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr29541030f8f.47.1795691528027;
        Thu, 26 Nov 2026 03:12:08 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm15925798f8f.54.2026.11.26.03.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:12:07 -0800 (PST)
Date: Thu, 26 Nov 2026 12:12:05 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Elkin Cruz <elkin@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	irogers@google.com, stable@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] sched/core: Avoid atomic cpuset_lock() in
 __sched_setscheduler()
Message-ID: <awgUBa_9VrhDahUt@jlelli-thinkpadt14gen4.remote.csb>
References: <20261125222729.1450842-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261125222729.1450842-1-elkin@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BPuXJ-etsrusLB2NW25-to8Obm_E0eHjoWY4st6RFDY_1795691528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 25/11/26 22:27, Elkin Cruz wrote:
> When Magic SysRq-N invokes normalize_rt_tasks(), it holds
> read_lock(&tasklist_lock) in atomic context and calls
> __sched_setscheduler(p, &attr, false, false) with pi == false to reset
> real-time and deadline tasks to SCHED_NORMAL.
> 
> For a SCHED_DEADLINE task, dl_policy(p->policy) is true, so
> __sched_setscheduler() calls cpuset_lock() (mutex_lock(&cpuset_mutex))
> while in atomic context under tasklist_lock and then skips
> cpuset_unlock() on exit because unlocking is gated on if (pi), leaving
> cpuset_mutex permanently locked.
> 
> Guard cpuset_lock() with pi (matching the non-atomic caller contract,
> where switched_from_dl() releases deadline utilization under rq/dl_bw
> spinlocks) and call cpuset_unlock() on exit whenever cpuset_locked is
> set.
> 
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Signed-off-by: Elkin Cruz <elkin@google.com>
> Cc: stable@vger.kernel.org
> ---
> 
> I am trying out new Clang static analysis checks for kernel bug
> classes, and they flagged this code as possibly buggy. The findings
> were triaged/fixed and commit descriptions were drafted with help of AI,
> then checked against linux-next (not runtime-tested on hardware).

Thanks for this, but I believe Mathieu's patch takes care of it already?

https://lore.kernel.org/lkml/9194486f15bb0cb36b51e4525f471d1150c0d58b.1795115075.git.mathieu.desnoyers@efficios.com/

Best,
Juri

