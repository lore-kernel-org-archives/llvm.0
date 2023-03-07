Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0337386
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678228864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HM1t/LESiZdLj96sPWnYhAC+VXHA55Mz7QgQS8ZJsLo=;
	b=BYRXj/slgNxj/w74a6gvlVNhGFptdTOCuqhy3LW3kI6Q6nDv8jfd8kVOUS3Pg+9sge++6i
	C5jkMR1fMV/O3d6qdRXSI0xcEK1pmQm2Gv3XwQk641rqVJLtjZaB8FAAEmTY3rCG2zWc//
	WQqUf5EuikF68hiRfSIvULCsAaIE9gE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-M18ajWrEOVyZO7WYBqUYig-1; Tue, 07 Mar 2023 17:41:03 -0500
X-MC-Unique: M18ajWrEOVyZO7WYBqUYig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3127101A5BA
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 22:41:02 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCEBD492B00;
	Tue,  7 Mar 2023 22:41:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master
 (6.3.0-rc1, mainline.kernel.org-clang, 63355b98)
Date: Tue, 07 Mar 2023 22:41:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <00603.123030717410301032@us-mta-628.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: cpumask: be more careful with 'cpumask_setall()'

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/76856

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/32028=
9
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/32029=
0
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/32029=
1
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/320293
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/32029=
2


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

