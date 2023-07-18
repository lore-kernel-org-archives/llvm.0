Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694DA17D4
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 03:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689649271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDLC8OXzKgHdzUoZ+XMFkyEy3WNRRfl52Si7F+D7aGo=;
	b=QSlZFvhhKqu6gJjHhseHCZz1/ZasjI1fB6oPzePbydIbknMYWaPlGrEvbGYHi8jvujK8r7
	80C+sCC3Uy7fNKc5b09DLaPDBtnrX3w5HtY3WVB6tF6OJog8aalu2jhWTVnHh7iFhbP56x
	JXkatb+1ErgBX2z7D53cg+BRX0iMWd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-wAWZQzB_OxaMnoV19CsyJw-1; Mon, 17 Jul 2023 23:01:09 -0400
X-MC-Unique: wAWZQzB_OxaMnoV19CsyJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2CC3101156F
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 03:01:09 +0000 (UTC)
Received: from localhost (ovpn-12-39.pek2.redhat.com [10.72.12.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE211454142;
	Tue, 18 Jul 2023 03:01:06 +0000 (UTC)
Date: Tue, 18 Jul 2023 11:01:03 +0800
From: Baoquan He <bhe@redhat.com>
To: cki-project@redhat.com
Cc: haliu@redhat.com, bgoncalv@redhat.com, xiawu@redhat.com,
	xzhou@redhat.com, llvm@lists.linux.dev, yizhan@redhat.com,
	jiji@redhat.com, yiche@redhat.com, zlang@redhat.com,
	yiyan@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKFNLSVBQRUQgNDkg?=
 =?utf-8?Q?of_328=29=3A_Test_repor?= =?utf-8?Q?t?= for master (6.5.0-rc1,
 mainline.kernel.org-clang, bde7f150)
Message-ID: <ZLYAb/03CSYZWW1K@MiWiFi-R3L-srv>
References: <39782.123071511204000362@us-mta-517.us.mimecast.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <39782.123071511204000362@us-mta-517.us.mimecast.lan>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 07/15/23 at 03:20pm, cki-project@redhat.com wrote:
...snip...
>          ppc64le - kdump - sysrq-c
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8784963
>                    Non-passing subtests:
>                        ❌ FAIL /kdump/crash-sysrq-c
>          ppc64le - kdump - file-load
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8784964
>                    Non-passing subtests:
>                        ❌ FAIL /kdump/crash-sysrq-c

The test_console.log and console.log are all empty. However, I suspect
it's same issue as below bug. And all ppc64le kdump failures should be
the same issue observed on 6.5-rc1+.

Bug 2222526 - kdump failed with the error "Cannot open /proc/vmcore: No such file or directory"

