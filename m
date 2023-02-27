Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4279EF
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677526210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oVTj0zQIrq6koDoUK132/YU/eErtQ2YPrr83ENbYJGo=;
	b=YgpJ5+7AEyxxv2ZDaonrVc3u969zoGQ5JWIxbHgvJHSpS8d4lsDak5DlfeJn4kMLjEKdzX
	BM+bfsQe8kyIcUG8vNDrVDgfkZ6kQn2LKZ9Oc4nNbfNDnnumtEtsmO5jxgANpKlKAh5Dzf
	F9J9lbOBN3mBmqyVFtgCPmiqaf5QcSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-u_yGGOBnOC2bxQAeDDBDLA-1; Mon, 27 Feb 2023 14:30:05 -0500
X-MC-Unique: u_yGGOBnOC2bxQAeDDBDLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F112085A588
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 19:30:04 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDCF2140EBF4;
	Mon, 27 Feb 2023 19:30:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 98281842)
Date: Mon, 27 Feb 2023 19:30:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <54441.123022714300500673@us-mta-32.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'arm-fixes-6.3-1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74644

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31724=
3
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31724=
4
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31724=
5
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317247
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31724=
6

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7274670



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

