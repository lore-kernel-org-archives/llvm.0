Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728E17559
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606931; cv=none; b=YviyP9+rh2EXUn8KBYIOo1ACP3tvtYnCaJoJg2vQVMOPyE6EvLeMQHrF/OZK37pwSHQ+LBS9ZZizzRBPy0TVZ1cCMcFCxK41BR0LgxlKvxsIjg2SmnU//Qe86CCsKCMMlr9M0DoN5GDD8ETPNWGlHZzKKEXG2PyMDG6UUpfbbh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606931; c=relaxed/simple;
	bh=qVRZHvgt1N/jJLUdq8VV93wxmyT8ze9afB967ZlBm+0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UR2dTzr163dWSesGLfiArszlRVaSsqEQkF5JkbR4ecbt9BvuePHV6KClmTIqKzjqVxZbI+KqQF+zMOg5nfKZmPHCYwXFjvwBosXE6lffwTlLBHhtyy2dAYZTgl8Qt5myM7hXTjlKf4hx3G9j8i6lE8nYUY4VyFjGEt7bCJqDqyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhNoX2Sg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhNoX2Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717606928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m6TDaPIFSvrP5NBC2gpFt9BsOt+ruiQ3RkMqREors+0=;
	b=dhNoX2SglJ6pPc30+fXSE3dw/dDPry6y2WRQ/N/GKXdPy78gOriLs1F4tXOLy5mE+FVMRL
	flXsCL3QnIKUiD9V13rC0l9bYdAlPsgc5lDJOCcR9lEdz2ySrBWX+Xku9n7JBzjDLykoS3
	hfApJhmEgIBL54amDcu5AghYfvUtfgQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-jIKI0G2mO5uCFLIpoQyoJA-1; Wed,
 05 Jun 2024 13:02:06 -0400
X-MC-Unique: jIKI0G2mO5uCFLIpoQyoJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6ED23C025B2
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 17:02:03 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2ADD0492BE9;
	Wed,  5 Jun 2024 17:02:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, 71d7b52c)
Date: Wed, 05 Jun 2024 17:02:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Message-Id: <07150.124060513020600558@us-mta-378.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1319839146

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319839146-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319839146-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319839146-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319839146-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1319839146-x86_64-kernel-debug


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

