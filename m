Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426C23AE
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 04:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690520234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wX2TF5iINzaUGa2XLdJuhPhIT47ZINk0QPzXR/odBBA=;
	b=jUuD3irsHoi9B2Mcj/kbupR/ztJNmryRPS/91y2Lr+m+r6IQuvwND8J3rIgQgLNxnUmdv5
	DmcvaoXhJ4FIXyqPKllvKQpWuiqkftiyivs4OsPYA3WAAiJU+eZM0ERmHRVK7C/Vg4uoJR
	4+WaGQAL1U8tMC3eBxYjLgTgSRqXdHA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-mPUih8EFN1SFA2zJbxJhgQ-1; Fri, 28 Jul 2023 00:57:13 -0400
X-MC-Unique: mPUih8EFN1SFA2zJbxJhgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C55D31C07590
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 04:57:12 +0000 (UTC)
Received: from localhost (unknown [10.72.112.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02340F782D;
	Fri, 28 Jul 2023 04:57:11 +0000 (UTC)
Date: Fri, 28 Jul 2023 12:57:08 +0800
From: Baoquan He <bhe@redhat.com>
To: cki-project@redhat.com
Cc: bgoncalv@redhat.com, yiyan@redhat.com, llvm@lists.linux.dev,
	xiawu@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKFNLSVBQRUQgMTkx?=
 =?utf-8?Q?_of_328=29=3A_Test_repor?= =?utf-8?Q?t?= for master (6.5.0-rc3,
 mainline.kernel.org-clang, 57012c57)
Message-ID: <ZMNKpJCzbAERwqp/@MiWiFi-R3L-srv>
References: <65365.123072800401200236@us-mta-556.us.mimecast.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <65365.123072800401200236@us-mta-556.us.mimecast.lan>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi CKI team,

On 07/28/23 at 04:40am, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge tag 'net-6.5-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/97648
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>           x86_64 - kdump - sysrq-c
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928580
>                    Non-passing subtests:
>                        ❌ FAIL /kdump/crash-sysrq-c
>           x86_64 - kdump - file-load
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928581
>                    Non-passing subtests:
>                        ❌ FAIL /kdump/crash-sysrq-c
>           x86_64 (debug) - Boot test
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928644
>                    Non-passing subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check

All these failure cases have empty console.log, there's no way to check
what's going on there. The empty console.log is related to 1st kernel,
there must something wrong withih it.

Thanks
Baoquan

