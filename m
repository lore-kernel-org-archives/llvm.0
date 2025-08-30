Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92DD7261A
	for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513390; cv=none; b=p/kjaQan5YXYQ/6zbcrtPBnIery2eYGiNYXkRdOAIj++0hBeslSb4llW46tyPzk5eznXSRcgyRBZnMDBALc/ElN+5iZnAhanSCXXs0djIdXBqaTZRHq/0TgWLxmtoxzs7lYInEPmy3gamRnUVuK2yIIavvAWgNf9utqVXkSuKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513390; c=relaxed/simple;
	bh=H52Gvg42+ooGJKJLwUaDslOJ7BFogGmTdL4dzsAn9Ho=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jirCKkr1bpd1t3ReJWZ/GEQQpuRlxjdoJd/DfpxcHIzWxg5X3wnntHo7tPTSmE2OnQ0ZJgfa6lasuM/3aOypZ922mICrt7vS2ZGWdbMjrE7kJcMKWQOYo9RFwNKPtvHVoU+urJJv1yqZvz0FzqVUNe5Lp0XEepGaHSnkFO3mAdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTXVznDd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTXVznDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756513387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1bVzrk1AbcS/HhXaGMDSdqDL0MfaK9AlNKlJ9qVSc0=;
	b=OTXVznDdxeHybHiMWeyvPD1g4OJ4HuWhDwXdN6GPYzX+axOlMRfR1sL7MgiMJogf65ajW8
	Am7Z2e7YQRAnhM5Zl1+XqHpQOCRMvRXkcX7qxzelgV98h5GcjLV6lVdAEsiuYEOEl8BADu
	PZXsLCZ6sjTg639M+NTfEprbMHiUlCQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-9rJLgS_LMyuQ1FeVWtmi3g-1; Fri,
 29 Aug 2025 20:23:05 -0400
X-MC-Unique: 9rJLgS_LMyuQ1FeVWtmi3g-1
X-Mimecast-MFC-AGG-ID: 9rJLgS_LMyuQ1FeVWtmi3g_1756513385
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1229B1956087
	for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 00:23:05 +0000 (UTC)
Received: from [172.20.143.215] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A5C861800291;
	Sat, 30 Aug 2025 00:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc3,
 upstream-mainline, 11e7861d)
Date: Sat, 30 Aug 2025 00:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <57754.125082920230600119@us-mta-478.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RtCJW0fCJBFg3vbcdoHTM-AYoR43bdwAaclWR1McHi8_1756513385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2012446091

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2012446091_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2012446091_x86_64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2012446091_x86_64_kernel-debug
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897


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

