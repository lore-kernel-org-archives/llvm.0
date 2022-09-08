Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D17C
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 01:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662599980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KkeliVyAWIocEVujJBFjjOh+aOWQyaOJIsYQqCkBqA=;
	b=RpIOw7ZMRKQq2ekKlZF/PVajOhKrqd+5rpPEw0vw8VY43Tt0yHVCcQrrJS1QGXjHP/JoQm
	mgvyeUm8hAURi+HeME70K+i9LJdMlGaJg8gSmj5PdNffhhWcrLAIvWoeRwZ5VtraBbkazl
	LifZYVnVVxoAJo/mJ6sXK48Tx4o9C1Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-YmJEg0PnOiaBef9gqcNRMw-1; Wed, 07 Sep 2022 21:19:38 -0400
X-MC-Unique: YmJEg0PnOiaBef9gqcNRMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A37E93C0218F
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 01:19:38 +0000 (UTC)
Received: from localhost (ovpn-12-219.pek2.redhat.com [10.72.12.219])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDB31410F38;
	Thu,  8 Sep 2022 01:19:36 +0000 (UTC)
Date: Thu, 8 Sep 2022 09:19:32 +0800
From: Baoquan He <bhe@redhat.com>
To: cki-project@redhat.com
Cc: llvm@lists.linux.dev, xiawu@redhat.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 master (6.0.0-rc4, mainline.kernel.org-clang, 0066f1b0)
Message-ID: <YxlDJCV6MTxogbbW@MiWiFi-R3L-srv>
References: <41701.122090715304311827@us-mta-647.us.mimecast.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <41701.122090715304311827@us-mta-647.us.mimecast.lan>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09/07/22 at 07:30pm, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: afs: Return -EAGAIN, not -EREMOTEIO, when a file already locked
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/52740
> 
> One or more kernel tests failed:
> 
>     Unrecognized or new issues:
>          ppc64le - kdump - sysrq-c
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/5069753

This is an old issue we have ever encountered in 5.17, no space left.
Please check below extract from taskout.log and the old gitlab ticket
issues. It's nothing much kdump side can do.

https://s3.us-east-1.amazonaws.com/arr-cki-prod-datawarehouse-public/datawarehouse-public/2022/09/07/redhat:632996638/build_ppc64le_redhat:632996638_ppc64le/tests/3/results_0001/job.02/recipes/12568764/tasks/6/logs/taskout.log
***extract from taskout.log
======extract from taskout.log
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com dracut[1032]: *** Creating image file '/boot/initramfs-6.0.0-rc4kdump.img' ***
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com kdumpctl[3700]: cp: error writing '/boot/initramfs-6.0.0-rc4kdump.img': No space left on device
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com kdumpctl[999]: dracut: dracut: creation of /boot/initramfs-6.0.0-rc4kdump.img failed
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com dracut[1032]: dracut: creation of /boot/initramfs-6.0.0-rc4kdump.img failed
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com kdumpctl[724]: kdump: mkdumprd: failed to make kdump initrd
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com kdumpctl[724]: kdump: Starting kdump: [FAILED]
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com systemd[1]: kdump.service: Main process exited, code=exited, status=1/FAILURE
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com systemd[1]: kdump.service: Failed with result 'exit-code'.
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com systemd[1]: Failed to start kdump.service - Crash recovery kernel arming.
Sep 07 03:09:16 ibm-p9z-27-lp25.ibm2.lab.eng.bos.redhat.com systemd[1]: kdump.service: Consumed 42.273s CPU time.
==========

***The old issue in 5.17 which warned no space left on ppc64le
====
kdump - sysrq-c: failed to save a vmcore: No space left on device
https://gitlab.com/redhat/centos-stream/tests/kernel/kernel-tests/-/issues/1163#note_1011391562

[ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot write: No space left on device
https://gitlab.com/redhat/centos-stream/tests/kernel/kernel-tests/-/issues/1047

