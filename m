Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CE13FF8
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691517620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dznNOeM75/whTsmYCQpVZ46+8tSHJY1C//zt3GLNV8U=;
	b=JSicmlqPVZEg/6mHkATfCLsoJwTf131e1HNQw3ZWzcVIIxisuTv6pSfN9kuFcWEjdPyjFr
	uhHGM4j1Xv68RrQVsGlydv6tJdH3Qj+8XHdK/vdWuL3Ktmu0kNHdQmU/p2BEqksKVt7lRE
	nzEE+9G15Fv1q0ddYw4fNGY18x8ImEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Miko-l5dPNi9l7uGB-0_kA-1; Tue, 08 Aug 2023 14:00:17 -0400
X-MC-Unique: Miko-l5dPNi9l7uGB-0_kA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D868D101A52E
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 18:00:05 +0000 (UTC)
Received: from [172.64.4.35] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C39874EA5A;
	Tue,  8 Aug 2023 18:00:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 02aee814)
Date: Tue, 08 Aug 2023 18:00:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <59697.123080814001700751@us-mta-633.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'gfs2-v6.4-fixes' of git://git.kernel.org/pub=
/scm/linux/kernel/git/gfs2/linux-gfs2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99122

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38269=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/382699


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

