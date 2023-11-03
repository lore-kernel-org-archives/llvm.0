Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B97E
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0syMQRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698980465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1f2NELoeNem9ZFE0sqSXGE9Q3RoWy1DOF4zjcDptYno=;
	b=V0syMQRRYI8Jv+rEsOD0ZZp0PV6+sVCUANaSGVdwNRXRrOqpyXL137K2SkLz5G7JDcaslS
	uLeR7N6vY7vMA92mEdk58jcUrVQf0P2EO/3d4oyZ9LqA9IzxgW8lueYiRZzQRD8D0laQ57
	ULwu4PfAc0LNqmZoa1w0cEI2UpOWGKo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-dvot1KaKNXS97MYFUOmK0w-1; Thu,
 02 Nov 2023 23:01:04 -0400
X-MC-Unique: dvot1KaKNXS97MYFUOmK0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C2F1C05AEB
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 03:01:03 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B27932026D4C;
	Fri,  3 Nov 2023 03:01:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.6.0,
 mainline.kernel.org-clang, 6803bd79)
Date: Fri, 03 Nov 2023 03:01:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <79092.123110223010400251@us-mta-412.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/112859

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/42267=
2
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/42267=
3
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/42267=
5
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/422676


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

