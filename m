Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA6A110B
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682471468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fENkqravDavluPnvEpmkLRr/7AsKUaPp2GJSWTPQ/ZI=;
	b=DuCFdug1CFIRFrikMTYHeMTm1Pz/vuAhY6QOb/98QxSNGWJvWvTqRj3oYQmBkEmuj5G5SN
	EpqhS3aXzH+GRNI7IaTUKVLccyTbTbeRki9OPVIRgiGJrP5B5diPzr/3BWVI5Yy5VGjyiI
	wnIee52wR3tdcVv5Afk4sQ++U2UuoDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-a43YYrizOqmtbnZOOL3Qeg-1; Tue, 25 Apr 2023 21:11:06 -0400
X-MC-Unique: a43YYrizOqmtbnZOOL3Qeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E23E51C0A584
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 01:11:05 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD6D94E3C5;
	Wed, 26 Apr 2023 01:11:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4o+t77iP?= SKIPPED: Test report for master (6.3.0,
 mainline.kernel.org-clang, 4ea95696)
Date: Wed, 26 Apr 2023 01:11:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <34422.123042521110600287@us-mta-96.us.mimecast.lan>
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
    Commit message: Merge tag 'media/v6.4-1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/mchehab/linux-media

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86049

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/33988=
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

