Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60210944
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687983608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5BiGP7ITj+WntmaHNlY1r2NRRZYl++znJ0jEErqT/3w=;
	b=WzgUnJRuni8RPrtUO/9WlcWYMS+COxsI1hp5CfE+kthPW7edRJhTzkJw7hn0N2GakBLrki
	EFj61dVjNfDOIssThOLQnM/ab6+jrgp6KL4UklrYgmnjTtudylCA9Mm+8Gh8sUnJn2HASI
	5jr/w6rwjv2ubd/ifOt0aMpPNfooWZ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-ycYQUiEKO9SyimJGRofdWw-1; Wed, 28 Jun 2023 16:20:06 -0400
X-MC-Unique: ycYQUiEKO9SyimJGRofdWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E5F381BDE3
	for <llvm@lists.linux.dev>; Wed, 28 Jun 2023 20:20:05 +0000 (UTC)
Received: from [172.64.9.13] (unknown [10.30.34.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A68A6C09A07;
	Wed, 28 Jun 2023 20:20:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 77b1a7f7)
Date: Wed, 28 Jun 2023 20:20:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <22341.123062816200600270@us-mta-509.us.mimecast.lan>
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
    Commit message: Merge tag 'mm-nonmm-stable-2023-06-24-19-23' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94052

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36704=
5


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

