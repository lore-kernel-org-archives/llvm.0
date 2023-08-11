Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C92F4E
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691793664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JacEY/XUEHbAJEFsdFJb13w+3Q9rU2QV+WjA2BojWYM=;
	b=Um9HyCrMufkvHJjHj+lEkKmWDpheGyk4i9GykmRe9h0kGRGT/0/f4MIldDuoJplSzAL9dZ
	ljBPVa7trbMPPHtFGpeOFnKAVvn/4LNIwOskXER/1Df6kX7lVAugRJGsFO1wjhlBCbMVQX
	Wu/B9l4P8DZleLHvdFtgwJJK8yiNQVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-E1bRE5IwNzuB_1FWlkCKDg-1; Fri, 11 Aug 2023 18:41:02 -0400
X-MC-Unique: E1bRE5IwNzuB_1FWlkCKDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D310101A528
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 22:41:02 +0000 (UTC)
Received: from [172.64.13.56] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2B3492C13;
	Fri, 11 Aug 2023 22:41:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 190bf7b1)
Date: Fri, 11 Aug 2023 22:41:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <50980.123081118410200527@us-mta-424.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-hotfixes-stable-2023-08-11-13-44' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99791

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38474=
0
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/384741


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

