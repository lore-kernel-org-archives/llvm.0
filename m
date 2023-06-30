Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88F8BEA
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688109668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5+7quqx0o6esChZvcv0r559zcDYYqjv7R6nJ41LgaQ=;
	b=ictJ+TeihwG8eOUGZockrWyyw5N2B0go5xCmlmwBj/y5MiMFc74Sy0RBu8ZXZy1KEgiIeq
	+pKDLikOTXlA/pWeqMLWN6qkZvpUnbM74xcYLVZp7tCihaqtPPLXO5QqFcQKqYIlhJ6VbB
	pnEl1hEDgiCH6ISZRoWldZ69zkgp0O8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-7jC7DbGwM4SPAmYidZpb6A-1; Fri, 30 Jun 2023 03:21:07 -0400
X-MC-Unique: 7jC7DbGwM4SPAmYidZpb6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2081C05ED6
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 07:21:06 +0000 (UTC)
Received: from [172.64.10.50] (unknown [10.30.33.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96428200BA8D;
	Fri, 30 Jun 2023 07:21:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 075e3335)
Date: Fri, 30 Jun 2023 07:21:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <79688.123063003210700153@us-mta-215.us.mimecast.lan>
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
    Commit message: Merge tag 'memblock-v6.5-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/rppt/memblock

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94323

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36795=
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

