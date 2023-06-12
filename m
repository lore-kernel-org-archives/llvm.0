Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FF19523
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686572951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dgg0OgOJU12ZjehTSKhsrI3f8hl+PZj/5z+qfu7sGs=;
	b=N8+oW2ar9N1VBobdYGwAxnIZBf+VYjn2d9wv10lBsFqdnxTvJTo6F3EWcgrlare9i4NeoW
	OOFI3zda7FKtz0GlCJuMOv5GgXnHbuoBqrRJbpRThuteFmjdSlspfkEUzKSxuDud5Xro9t
	zxwqrkyPcDvwdjY1poTOoEX75SB2q2M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-3En1NM25P2uKjcBqVn-S2w-1; Mon, 12 Jun 2023 08:29:10 -0400
X-MC-Unique: 3En1NM25P2uKjcBqVn-S2w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30fb891c5e3so2963454f8f.2
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 05:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572949; x=1689164949;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dgg0OgOJU12ZjehTSKhsrI3f8hl+PZj/5z+qfu7sGs=;
        b=lSupX848GgCGJGhO/hmVoxQQVOm6F4Olbu1UYrI3SbrYIc+04nC5lfRQHB/nG+xcaN
         V55QggAN/O0HIn/U6ql1OfSjNc5D3NOmlDW45KHhIkwIGpx0y8IEu4hXCFiw+Her0IoH
         y0vteaWH2BcISxeRZspYTKauYJ/zFBoyyunWUqrmcvRmEsHdevQv49jDg73SB4I8kMp0
         D8i+RT79K41b8ddRn+KqvqU+Vl+I5SCM4EEnRg/b9qrplRXRw0zAqqGiG/I+O6lJQUm4
         HrSewBtSOnjEP7jE1vkrAJWb7PsqgCGJL87h9FEw7wd8kJY67t+0fLwwJwg6KDFAtFjV
         Nnbg==
X-Gm-Message-State: AC+VfDzGHHbCGhV8Xaa55CizINWQJEHOmw7WTImH3Mgl/PyWBRIT/RIR
	1o5GUzDI27gE6LgICT3gaRKgmeSji+DV3n6WqLI5xMWwoJu+zUstKMELpBtEXZt0Zp9CcW8SOol
	Xq1sNWvQ8YnEcEQ==
X-Received: by 2002:a05:6000:46:b0:301:8551:446a with SMTP id k6-20020a056000004600b003018551446amr5487558wrx.2.1686572949303;
        Mon, 12 Jun 2023 05:29:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fBLeRHNV68IRWXYyURn+/HcT7IJFIXUfu/3QIa+LzCGdz9usgp/jdi45lJIFln4oX75UC+w==
X-Received: by 2002:a05:6000:46:b0:301:8551:446a with SMTP id k6-20020a056000004600b003018551446amr5487541wrx.2.1686572948916;
        Mon, 12 Jun 2023 05:29:08 -0700 (PDT)
Received: from [10.32.176.150] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.googlemail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm12301884wrr.21.2023.06.12.05.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:29:08 -0700 (PDT)
Message-ID: <29924c50-cf96-13bb-ef84-4813caa3aef3@redhat.com>
Date: Mon, 12 Jun 2023 14:29:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Greg KH <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
 masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
 vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org, mingo@redhat.com,
 longman@redhat.com, boqun.feng@gmail.com, dennis@kernel.org, tj@kernel.org,
 cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, paulmck@kernel.org, frederic@kernel.org,
 quic_neeraju@quicinc.com, joel@joelfernandes.org, josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, rientjes@google.com,
 vbabka@suse.cz, roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, john.johansen@canonical.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 llvm@lists.linux.dev, linux-perf-users@vger.kernel.org, rcu@vger.kernel.org,
 linux-security-module@vger.kernel.org, tglx@linutronix.de,
 ravi.bangoria@amd.com, error27@gmail.com, luc.vanoostenryck@gmail.com
References: <20230612090713.652690195@infradead.org>
 <20230612093540.850386350@infradead.org>
 <20230612094400.GG4253@hirez.programming.kicks-ass.net>
 <2023061213-knapsack-moonlike-e595@gregkh>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 46/57] perf: Simplify pmu_dev_alloc()
In-Reply-To: <2023061213-knapsack-moonlike-e595@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/23 14:18, Greg KH wrote:
> Yeah, it's a pain, but you are trying to hand-roll code that is not a
> "normal" path for a struct device, sorry.
> 
> I don't know if you really can encode all of that crazy logic in the
> cleanup api, UNLESS you can "switch" the cleanup function at a point in
> time (i.e. after device_add() is successful).  Is that possible?

What _could_ make sense is that device_add() completely takes ownership 
of the given pointer, and takes care of calling put_device() on failure.

Then you can have

	struct device *dev_struct __free(put_device) =
		kzalloc(sizeof(struct device), GFP_KERNEL);

	struct device *dev __free(device_del) =
		device_add(no_free_ptr(dev_struct));

	/* dev_struct is NULL now */

	pmu->dev = no_free_ptr(dev);

Paolo

