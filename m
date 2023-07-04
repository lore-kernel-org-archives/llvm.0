Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD96620
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 01:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688434867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=209KvE6fF4VD1q5W9bcmpBTTAhIBoUeFIQHLERsxBPo=;
	b=dIgPmNFuxS5IJTTOC/izPgetDzoTNNSKLsOQf8XqFIAt5ja4EjGRgPHN9wB6L6ycHfAcrV
	5EU9656opCSuTsLWAa9AsNcUDjBJ8C1PY7FhU99AjHW6LJWEw5HXzW9WtkT7BFqvp8Z0xk
	5qtmCK3O375DMSdA3CXJn5WEu12EHtM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-RZMhp3CcMUOYehhTEgXOVA-1; Mon, 03 Jul 2023 21:41:06 -0400
X-MC-Unique: RZMhp3CcMUOYehhTEgXOVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E93FC185A78B
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 01:41:05 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4AA51121314;
	Tue,  4 Jul 2023 01:41:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 69c9f230)
Date: Tue, 04 Jul 2023 01:41:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <00479.123070321410600245@us-mta-272.us.mimecast.lan>
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
    Commit message: Merge tag 'hsi-for-6.5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/sre/linux-hsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94651

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36901=
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

