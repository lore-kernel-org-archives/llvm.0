Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFEA1360
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyUS6ZR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698977465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c7UtYFkPoVNx/tIWnhc88A45GmaF9LepfGobKP6HbVw=;
	b=JyUS6ZR7dmoYUQmSXIEVeottYKNkB2iJ/DwU8sYMYo6AkBZgeR9nEy3+99uOR6pX2P8z7K
	J6vNzr5kCli0E9HKj3Ej9sfuhEhzVEJiaNOIZpSIijuFhYBcU5K2gYVeIFXq58EHSx42Pu
	bNP/Z6rJ8lOavDc7XEbHGnyfyYbb3Lw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-yxUCq4SFO-udCxEycn92cQ-1; Thu,
 02 Nov 2023 22:11:03 -0400
X-MC-Unique: yxUCq4SFO-udCxEycn92cQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D85238130A2
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 02:11:03 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1535540C6EBC;
	Fri,  3 Nov 2023 02:11:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.6.0,
 mainline.kernel.org-clang, 43468456)
Date: Fri, 03 Nov 2023 02:11:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <37185.123110222110301289@us-mta-131.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/112856

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/42265=
7
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/42265=
8
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/42266=
0
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/422661


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

