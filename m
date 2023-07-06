Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A910EF
	for <llvm@lists.linux.dev>; Thu,  6 Jul 2023 06:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688623263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wop915USl48WrzPYyFcDpDTGsk6Lq0TI590svb65mhc=;
	b=cfxYmggDFYJUHJhLCjIbI3CgStLUzb7h/GY3/9m+tP1eqDZM8NDs4e/wzzo5+Qc66KqUHo
	nCTY2BRPm0RD0RD5btvSA2O6ZcbQiZ5M/xoa6HvqdXxpTr6yEJY5HSEYdTCdV/Nj4nkGZT
	pgB0wWJaVp05c9yztfXLbCoKFI50yt8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-tqkO-1jYNgeveBPGLkZ4Mg-1; Thu, 06 Jul 2023 02:01:01 -0400
X-MC-Unique: tqkO-1jYNgeveBPGLkZ4Mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF92D29AB3F0
	for <llvm@lists.linux.dev>; Thu,  6 Jul 2023 06:01:00 +0000 (UTC)
Received: from [172.64.15.54] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE94D1121331;
	Thu,  6 Jul 2023 06:01:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, c17414a2)
Date: Thu, 06 Jul 2023 06:01:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <03293.123070602010100206@us-mta-489.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'sh-for-v6.5-tag1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/glaubitz/sh-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94975

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/37002=
0


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

