#ifndef	__MIDI_h__
#define	__MIDI_h__
//	write your header here
void MIDIPowerUpInitial(void);
void MIDIWakeUpInitial(void);
void MIDI_Play(unsigned MIDIIndex, unsigned DynamicAllocatType);
void MIDI_DataCounter(void);
void CheckMidiDuration(void);
void ServiceMIDI(void);
void CheckADSR(void);
void SetUpTimeBase(void);
void SpuIrqMIDIService(void);
void PauseMIDI(void);
void ResumeMIDI(void);
unsigned int GetTempo(void);
void SetTempo(unsigned int Tempo);
void SetTempoUp(void);
void SetTempoDn(void);
void MIDIOff(void);
void MIDIOn(void);
void RepeatMIDIOn(void);
void RepeatMIDIOff(void);
void MuteMIDICh(unsigned int MIDIChannel);		//MIDI Channel = 1~16
void UnMuteMIDICh(unsigned int MIDIChannel);		//MIDI Channel = 1~16
void KeyShiftUp(void);
void KeyShiftDn(void);
void ChangeInst(unsigned int InstIdx, unsigned int MIDIChannel);
void EnMIDIChVolCtrl(unsigned int MIDIChannel);
void DisMIDIChVolCtrl(unsigned int MIDIChannel);
void EnAllMIDIChVolCtrl(void);
void DisAllMIDIChVolCtrl(void);
void SetMIDIChVolIdx(unsigned int VolIdx);
void SetMIDIChVolUp(void);
void SetMIDIChVolDn(void);
void SetPitchBendUp(void);
void SetPitchBendDn(void);
void TonePitchBend(unsigned int SPUChIdx);		//SPU Channel index = 0~7
void PlaySingleDrum(unsigned int SPUCh, unsigned int InstIdx, unsigned int VeloVol);
void PlaySingleNote(unsigned int SPUCh, unsigned int MIDICh, unsigned int NotePitch, unsigned int InstIdx, unsigned int VeloVol);
void SingleNoteOff(unsigned int SPUChIdx);		//SPU Channel index = 0~7
void PlayOneKeyOneNote(unsigned int InstIdx);
void OneKeyOneNoteON(void);
void OneKeyOneNoteOFF(void);
void OneKeyOneNoteRelease(void);
unsigned int MIDIStatus(void);
#endif
