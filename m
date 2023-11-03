Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920961D68E
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZU05c13R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699045263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=29sg2bxG4h/lZi/1JAy62ZBijmK94rFh08R7kiBqL+k=;
	b=ZU05c13RIQOY8Rubu9nl/X0XEL6VYfTLscfEq8qpBnv5K2QPZjtI1w6xWs6M6NBi0qeKE0
	GsUDV+MrjDq7akzBIExAIdx/bf+CaimPJN8xaNgwAEwURgXLVPuiaUIvexhkMqJYvZHB+5
	Kmz9DyKVbAc4/z6R6RaWf18/KrHmfx4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-6B_f7gnOMIW3fGKBOtsOMA-1; Fri,
 03 Nov 2023 17:01:02 -0400
X-MC-Unique: 6B_f7gnOMIW3fGKBOtsOMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E23A7380662F
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 21:01:01 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC7B91C060BE;
	Fri,  3 Nov 2023 21:01:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.6.0,
 mainline.kernel.org-clang, 6bdfe2d8)
Date: Fri, 03 Nov 2023 21:01:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <18979.123110317010200343@us-mta-245.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'apparmor-pr-2023-11-03' of git://git.kernel.=
org/pub/scm/linux/kernel/git/jj/linux-apparmor

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/113057

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/42319=
0
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/42319=
1
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/42319=
3
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/423194


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

