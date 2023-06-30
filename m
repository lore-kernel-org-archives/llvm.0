Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE01FCE
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 05:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688103065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Ft9kDnichzinFb8wxjcGKtsDMHgEcRnxePIz8JTnv4=;
	b=hrK+LPp3T5G7lhfIvGDqJz/5JG3jlmRbMLaJYd/J34I573pkY6IqW3waM8tUZueCGxcBtv
	3PxvisvIQ5lNVORZxjQKOZaO788Lo0KlECFbxTrVwZ4PNnF5hdOwE7BdFhIqlvgw+t1Qlw
	T2k12CVraDW5sT1PMjGyysltphHbdjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-J5FRk0qSNY2vD2LnaNrBoQ-1; Fri, 30 Jun 2023 01:31:03 -0400
X-MC-Unique: J5FRk0qSNY2vD2LnaNrBoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EF5488D1A3
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 05:31:03 +0000 (UTC)
Received: from [172.64.10.50] (unknown [10.30.33.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBF21200BA8D;
	Fri, 30 Jun 2023 05:31:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 1e6d5dea)
Date: Fri, 30 Jun 2023 05:31:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <34756.123063001310300289@us-mta-227.us.mimecast.lan>
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
    Commit message: Merge tag 'dma-mapping-6.5-2023-06-28' of git://git.inf=
radead.org/users/hch/dma-mapping

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94316

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36792=
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

