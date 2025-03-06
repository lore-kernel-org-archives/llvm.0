Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BA277803
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297996; cv=none; b=OiIV+XhiRIZxzj7gEmGceruymnjaGKbCYAtnTEZyLb7ju3sq6JgBKmbNeoJ1MTBBimR6Mh6vJm6YZfqUqj5uC0Wp0NYt2eDgT3pisBjLX7Mdfy5Hc5yxDfBWVBouc+sX+MUhZfNCF1/zQEPrW2aJ4LN8hDRFooItXllhHMlcumc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297996; c=relaxed/simple;
	bh=djUn8NqU1kgcxC3PYFNCJmSim3TYNE8S6T24IysiOqI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OXpJlqgKwlGHFvxdgzmxjhlJAS+1OiPiv7YJdolzuRTrElvxTgcCQ1TL33wK4Ta8dPqYy9m5VXt+ZxLyiAHrfwyvKAzuLGU41hz+khSKSbufDerL3PrNOGyFxaFrroESGd1uTPzJhXTxowYR3mL42AHElrCv1ZbsO8XVDaIFhW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iN20WJHS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iN20WJHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741297992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BaRkPyh+T2d1wA587NQcQDgUmY4W0lEvQ96dSD3VCT4=;
	b=iN20WJHSEdoyaFhqyVoRe6YrlpBHqup6JX3tk3bamiojGr7YCc5bothrW+FMGvsEMjIoDn
	1r7DPmL71jBtOUCC9GqnnyEA8dXw0dcI7lh731iQM7tzOON8YcquFIq+QBSoUPUb2Wgbew
	h/BIqcb3hanAsyBecyJInDODCSlzaFk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-CfdTp9ANP72rNbdwKeuX7w-1; Thu,
 06 Mar 2025 16:53:11 -0500
X-MC-Unique: CfdTp9ANP72rNbdwKeuX7w-1
X-Mimecast-MFC-AGG-ID: CfdTp9ANP72rNbdwKeuX7w_1741297990
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89442180AF72
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 21:53:10 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 307681955DDE;
	Thu,  6 Mar 2025 21:53:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 1238f0af)
Date: Thu, 06 Mar 2025 21:53:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <51039.125030616531101221@us-mta-79.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WfJTnh1uT23LvqdYFFqinU4b6ycvz-6czAr5h2cx2tI_1741297990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc5-smb3-fixes' of git://git.samba.org=
/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703763871

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703763871-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703763871-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703763871-x86_64-kernel
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

