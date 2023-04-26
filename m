Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789A136F
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 03:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682478666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k/RAVMxIUNYWsjckgk0yEXnmqbBM4QCn37Ff8bbSOug=;
	b=BXPxV1uua/Mc9Zf+hiQqCzqsUsrG5x8jdv1hXnMvrtBoKQiwnTdPeTYGNXN5UgAf/I+iD8
	3x3p6457/7I+Lp2+JKdlKmZuwT3Ane6ZdW5QJMUlg+AFmhEf+d6ov8CJ1M0oyhi8ZeHh/A
	JGoyVbGA0fZR/If4EEPY4leT/r0/8UQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-_2DyNk0FPbWrKRn2GpoSRA-1; Tue, 25 Apr 2023 23:11:04 -0400
X-MC-Unique: _2DyNk0FPbWrKRn2GpoSRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A04823C02183
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 03:11:04 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AE3240C2064;
	Wed, 26 Apr 2023 03:11:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4o+t77iP?= SKIPPED: Test report for master (6.3.0,
 mainline.kernel.org-clang, 0cfd8703)
Date: Wed, 26 Apr 2023 03:11:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <85834.123042523110400607@us-mta-351.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: SKIPPED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'pm-6.4-rc1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86053

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/33990=
6


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

