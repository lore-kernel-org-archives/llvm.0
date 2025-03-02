Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9C14900B
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740943931; cv=none; b=efg03822Qq1Gx2Re4jdPczKS6WGT7jE8k5/stvy6KWh6kRfio5t7Y+LO1ABvLc6jUSBihTEtcXLrRsF7g66SAVOTeuL0iQGwJ+7pigypV5sELQbZsWV0RJFRpsmjSNZv1m37b/p0HMXc3vpBBYFZff8uD69St6yX0yXKDgv4O8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740943931; c=relaxed/simple;
	bh=79HxG3Cx7D6AU5hqUWBvfhaZIi6uba8zQQ915B28riA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TykA/jXE6+3UB8JF/v0DCWxJ/fc5Z6E4rxDQIpSWwBuP5F6gB5TEqD1wCgibiOUqQ0EfK2thrpYPrOPQ0BKWzuXTsrFBZ0YXh0Ih7Zwp5dJWkMs4yy4YH8LAPmXZBzVYQU5rVWy/knurdPbJh1d/WDRqgPq1QcYl6bfSic2vrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYu/jM4z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYu/jM4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740943928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/hvXVGdojSfHSzOeHeOs4rJLr1bxXFXQyiv0OPyWLa0=;
	b=ZYu/jM4zyv8ft9JdmzfkcMuhnNdpICD48yB3U3iTIuC1qvone/S/5/ks/LBBJpf8DUk/qC
	ANNT7g8951Vcd07A0OIOOVU1TRRTkrWriOUGCdhlxPKSiVtTSbreaW/yGXuh85NEefflK0
	8Ed92S8rabA4lEJ1XFIYjzq1QRQGTUs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-u6j-81aLPVObQlcKArIbAg-1; Sun,
 02 Mar 2025 14:32:06 -0500
X-MC-Unique: u6j-81aLPVObQlcKArIbAg-1
X-Mimecast-MFC-AGG-ID: u6j-81aLPVObQlcKArIbAg_1740943926
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2CAF1800871
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 19:32:05 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4130D19560AB;
	Sun,  2 Mar 2025 19:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, b91872c5)
Date: Sun, 02 Mar 2025 19:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <49059.125030214320600339@us-mta-643.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dlPlP2EcHK7Cpxj4wRk9TWcBjPuTt4h11nFxWhMvPHM_1740943926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'dmaengine-fix-6.14' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vkoul/dmaengine

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1695704441

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1695704441-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1695704441-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1695704441-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

