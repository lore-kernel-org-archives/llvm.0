Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F417E
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 03:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y33iwhea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698982263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jhdX1WBjEiqDkKvph5oUcp6F+73kdOR5hH62TDMCo/c=;
	b=Y33iwhea0P10+U+dADAAFtFns5bQfjZsUNopoKEYX4bGkhMUsfHj/PkNG797r3Pifz3xqn
	XX6vq9dl4kcFmvtCndvohmaKMa4ipC84jwAYebDfhoV1ekc4ddOsxHXTu2Ts7lFQWaZ9Yp
	8O92zuYxk4H/tSQc/AZhivpI2qH5LA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-H3aKFTYfPPSd3Fo1gG6-CA-1; Thu, 02 Nov 2023 23:31:02 -0400
X-MC-Unique: H3aKFTYfPPSd3Fo1gG6-CA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB124811E7B
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 03:31:01 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5B18C1290F;
	Fri,  3 Nov 2023 03:31:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.6.0,
 mainline.kernel.org-clang, bc3012f4)
Date: Fri, 03 Nov 2023 03:31:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <98780.123110223310200188@us-mta-371.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.7-p1' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/112866

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/42269=
5
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/42269=
6
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/42269=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/422699


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

