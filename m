Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375210FA
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677786674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VlwDxX/BHq1VRb/3WhksLmN+LiXTlQplnBieyPrmbiY=;
	b=FKpQjDrp/I9Jk+/yqf3p51VAUAWX01Hy65hIg3iuuqwAwWzjugCeng1VDakCW0AXioxG98
	y8Pu5/eE3ta1f1tbfrPQar0hNNQ61+rTu97B8pAqWEsCyhtaOqcB/z5ZEdqmfQZ0bPrh+J
	0R21/Ajw9Jwhqojef0UMuM2Hc/495Ko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-NUvfXzMgOmmzZB1NiTUJ_w-1; Thu, 02 Mar 2023 14:51:11 -0500
X-MC-Unique: NUvfXzMgOmmzZB1NiTUJ_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C83B585CBE7
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 19:51:10 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEDD9492C18;
	Thu,  2 Mar 2023 19:51:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, 04a357b1)
Date: Thu, 02 Mar 2023 19:51:10 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <79380.123030214511100932@us-mta-628.us.mimecast.lan>
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
    Commit message: Merge tag 'mips_6.3_1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/mips/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75497

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31843=
5
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31843=
6
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31843=
7
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/318439
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31843=
8


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

