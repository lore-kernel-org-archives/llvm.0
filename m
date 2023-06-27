Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73FEA1
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 04:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687839606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGN9UK7trVlRFvvofwpxBciUgFI5PcFk4VsfGWMSU7c=;
	b=RM6qhMi8VkNEfKW37Pdb4qe7nksh49oRwOFrCKEYQzsRXBsvdUik1ZEek0LA8maB3MrWmQ
	JmzYizqO9HqX2bTO/axLLwZwWldb1HUh/4s6wP/gGi7isesTCn8/kEqgh3OL4BoG0pF/eW
	SshK1QKuRETnc+8sf8uBb4vNhfW2QSs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-fiGZmJHOPoiYh9o6IDDwAw-1; Tue, 27 Jun 2023 00:20:05 -0400
X-MC-Unique: fiGZmJHOPoiYh9o6IDDwAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80E57280D587
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 04:20:05 +0000 (UTC)
Received: from [172.64.3.17] (unknown [10.30.33.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A76540C6F5A;
	Tue, 27 Jun 2023 04:20:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 1ef6663a)
Date: Tue, 27 Jun 2023 04:20:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <43255.123062700200500537@us-mta-464.us.mimecast.lan>
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
    Commit message: Merge tag 'tag-chrome-platform-for-v6.5' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/chrome-platform/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/93716

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36592=
7


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

