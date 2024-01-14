Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B11846
	for <llvm@lists.linux.dev>; Sun, 14 Jan 2024 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STIV+eUZ"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5989d8decbfso2279832eaf.2
        for <llvm@lists.linux.dev>; Sat, 13 Jan 2024 22:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705214947; x=1705819747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KXgb9X1CWd/PEEQiac+jZy6kkV3an6+pNU+vSf7jMVI=;
        b=STIV+eUZhp+uxhuAdqdJLsLJDcizNau1prk8Te1MhFN3LUTeuhxxPnH/iuo+T+noUE
         V+rHz7+uqcI+qEvuD5KmXJx0KQl1tMfnS86zp3NhMF++bBSHl2LoAvGVD7zk4hjrrjzF
         UPdxdlGkOXGLUirKFsW4MknDsA5FVL4LSB8rgdVQdSUReJSbVVaEE4hvEzUcmGGIpuNq
         WeV5EQ+MQn2Lsn6fUnbMqu8A25rzNxqiwLfzLMqb0NatSLZPKujKu10L6edsm6O20Kpt
         UaWLJB8MKur524MAtKFt8602BP+KgcRcX8nyk5Shk+kUQ2B0uHLMshOpY0T0D8w2Gw6P
         8zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705214947; x=1705819747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXgb9X1CWd/PEEQiac+jZy6kkV3an6+pNU+vSf7jMVI=;
        b=eqDZNhPcS4Mldx4g4OZeMrTsD3BVwVJNsF22XYxeHXjAf4viUGWtBbJC6ifdeYmKY/
         fyC8XBwFoEXRlzAMUiGrIYMy89qIf5Puh2/CZe8xmLFUqSwAeJpRLwus/ZhC9GsR6lU7
         6rNvj8FFWU81c1aq5McZQ+NzC/AQp1+rCbpi5KZ4w1SwJtbR6iV0o0EEzWBB81EuqUfi
         EKMYZ0JdgfehoDA1WwK9QGF4dWL7kFIkoIMYnT7InR0H5i4ZCVCe4+7cRYTTRE24wbFZ
         Dh7Cshw7lPJWvyTp76PxC/OXp9FN7y4N3esu2DTr9k+rE7jXr60NOD0TQoD1FyZZTl5q
         rtxQ==
X-Gm-Message-State: AOJu0Yzk+c1cEDWUYSKmu8Q5tMWJk56IDqqWZHkJg0OMHD27ceAxuIDx
	02aBL6HFbDijAtz9vd3B4ic=
X-Google-Smtp-Source: AGHT+IF+BhC+uyf16yTJ+jUA9mpcMjuWd8QqAGGlDxYx1+oguvtkEI4G6Be+ISFZ+jyWpVAJfh2wPQ==
X-Received: by 2002:a05:6358:9fb0:b0:175:a9ce:e69c with SMTP id fy48-20020a0563589fb000b00175a9cee69cmr16814rwb.44.1705214947397;
        Sat, 13 Jan 2024 22:49:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d314:4131:10f8:370e])
        by smtp.gmail.com with ESMTPSA id sn15-20020a17090b2e8f00b0028bd303dc58sm7292213pjb.11.2024.01.13.22.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 22:49:06 -0800 (PST)
Date: Sat, 13 Jan 2024 22:49:01 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
	frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 03/57] locking: Introduce __cleanup() based
 infrastructure
Message-ID: <ZaOD3UWFppRDJ6bs@google.com>
References: <20230612090713.652690195@infradead.org>
 <20230612093537.614161713@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612093537.614161713@infradead.org>

Hi Peter,

On Mon, Jun 12, 2023 at 11:07:16AM +0200, Peter Zijlstra wrote:
>  
> +DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
> +DEFINE_FREE(mutex, struct mutex *, if (_T) mutex_unlock(_T))

I got excited with the ability to have mutexes released automatically,
however the code I work with typically uses mutex_lock_interruptible()
and friends, where resource acquisition may fail. Additionally, the
return values are integers and not pointers, which makes them unsuitable
for something like

	struct mutex *guard __free(mutex) = mutex_lock_interruptible(...);

I guess we could make wrappers around mutex_lock...() family to return
either the mutex or ERR_PTR-encoded error, but that feels quite ugly.

Do you have any suggestions here?

Thanks.

-- 
Dmitry
