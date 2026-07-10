Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F52D3A7C
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701131; cv=none; b=AI9hHez/xjSbYRKK6Kll2O0btjS9OIkAfQKmu3+HHY0HzddVA+RtoiTTIurqOVAxjZlu42f9zGlpuQHz6BGZooNcysYrgONRM6iSTZpwqOebDVxN8Y4rI92xBnba7qzuJ7YQ0NMOcwtyQXx1/3f1hlffHKj73UYQ21MibN74Vmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701131; c=relaxed/simple;
	bh=MT4Q55jzP4dOXqhVXJws0EFgCfSDTl14ZzwSPuTBWyg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eIz8MJr1qLE0rWJTAXxeI/eLqMqU/NLQzry83+knFEp4sOoblz24urkXL0iHI2EY75vw4b6ebMXJjOT3pHiniF+p8U1ydMz2UwPMhR94qtbENi4pZ9OGdg9HbFeN4G9pu57sRukYLARIsVjdDSyCQP99oPBSJrkwts3L1r6+3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCbckGSE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCbckGSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783701129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dOWWCHCmtcN3HmoEl000jEMLoWhOfcADcEvYuB/RJN8=;
	b=DCbckGSEt/3z25AmhWLQSFkyzHczD6ZQyMYnG46M/1LpPVGDrw8WGnn+cRPSw+TkBhCsZJ
	NbJ1fLbw3vi18XEU81B4abEnQkMMWlzbinn/u/UVyoxbtp1qNpUo8jlew9KetL93dgtbC0
	b6Q3hoIlXeYeKx4FY9oxm4xcX5Omm9E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-8YQBrRpDOsO-hfrxUX-r3w-1; Fri,
 10 Jul 2026 12:32:07 -0400
X-MC-Unique: 8YQBrRpDOsO-hfrxUX-r3w-1
X-Mimecast-MFC-AGG-ID: 8YQBrRpDOsO-hfrxUX-r3w_1783701126
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF6861800846
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 16:32:06 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 388421800678;
	Fri, 10 Jul 2026 16:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, 0e35b9b6)
Date: Fri, 10 Jul 2026 16:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <11352.126071012320702543@us-mta-106.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b7BG__BL5AFdOThe0UFARg5L5iD78ixR8AerOWSAZwk_1783701126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'mm-hotfixes-stable-2026-07-06-17-49' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2665927886

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2665927886_ppc64le_kernel


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

