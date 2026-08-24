Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B641E6C5
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576532; cv=none; b=sO91GkBrDOj7L61DGktJBhNuIGHZ84/svqPMYBAMtkoOcwHqxQBemT5NgRC+9ps7t9LegXEyu9lKUIxlxIrghrVmPzsOtr/0wQdEPDt4iQuUaqT/sfYhDx70hiNCikfsN4Yqi+ZR9lUWKx6zpvTQibnWiVKfuLuqKmWSDM7yB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576532; c=relaxed/simple;
	bh=ZyW2A9FZH/PO92teH4jZ2RNni68x/GqFL+aGTH5EzIc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=K37C0+95qTWlsrJgEw9kgtu7kY5VIsE1QCRNn5Wk81eJSV+6BcDzn2LSV7AUyD8WKQwegM1WI6o5vXcyMjux/GG9q/F6GZW0AzibUDXmWNm+qwCjmLeqtw+940eF1s+rQnAZ/MJxivZmJjpgnJ9q4cyTAAWqf+m8PQ4wDri12Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHnx/GSA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHnx/GSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787576529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AlUINUWeacIpwbATu5FTyOHcb6xAZSV//FuOI7on6+A=;
	b=JHnx/GSAiK1EvyzKO9EZo1vsSeedM3mR0mp3JHlsy16FTrl+Nej7wgUnNcFBl6kc80PK3A
	oEDbG1QcuYr7hw3ismAZRO7hIJJR3Az/vSHqI5uUywI5siwYdLdHwRHQnxJ4YF3FGVfonf
	h2n7RtlkNxC5j867c7MqiclzNxqYD2M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-ci60dBAeMvm4xO5j_W9dHA-1; Mon,
 24 Aug 2026 09:02:06 -0400
X-MC-Unique: ci60dBAeMvm4xO5j_W9dHA-1
X-Mimecast-MFC-AGG-ID: ci60dBAeMvm4xO5j_W9dHA_1787576525
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39935195FD03
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:02:05 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 89FEA18005AD;
	Mon, 24 Aug 2026 13:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-0,
 upstream-mainline, 66fb95a5)
Date: Mon, 24 Aug 2026 13:02:04 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <36674.126082409020600431@us-mta-528.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pAv1AmSL0Kt_oA8nYYfY05xUlershzP43ZrE_0h4RYA_1787576525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'caps-pr-20260820' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/sergeh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2782079087

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2782079087_x86_64_kernel_kcidb_tool_1200062527_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

